import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:protobuf/protobuf.dart';
import 'proto_codec.dart';
import 'websocket_client.dart';
import 'message_dispatcher.dart';
import 'package:flutter_trader/network/pb/comm.pb.dart' as comm;
import 'package:protobuf/well_known_types/google/protobuf/any.pb.dart'
    as gp_any;
import 'package:flutter_trader/network/pb/gateway/gateway_msg.pb.dart' as gw;
import 'package:flutter_trader/network/pb/user/user_msg.pb.dart' as upb;

class SocketService extends GetxService {
  WebSocketClient? _client;
  final status = ConnectionStatus.disconnected.obs;
  final _messagesController = StreamController<dynamic>.broadcast();
  final _errorsController = StreamController<Object>.broadcast();
  StreamSubscription? _statusSub;
  StreamSubscription? _msgSub;
  StreamSubscription? _errSub;
  final Map<String, List<void Function(comm.SocketMessage)>> _handlers = {};
  final List<void Function(Object)> _errorHandlers = [];
  final Map<String, List<_PendingRequest>> _pending = {};
  final Map<String, List<_PendingRequest>> _pendingByTypeUrl = {};
  final Map<String, GeneratedMessage Function()> _typeFactories = {
    'gateway.heartbeat': () => gw.GatewayHeartbeatResp(),
    'gateway.errornotify': () => gw.GatewayErrorNotifyPush(),
    'user.sgin': () => upb.UserSginResp(),
  };
  MessageResolver? _resolver;
  Timer? _hbTimer;
  static const Duration _heartbeatInterval = Duration(seconds: 30);
  static const Duration _connectTimeout = Duration(seconds: 8);

  Stream<dynamic> get messages => _messagesController.stream;
  Stream<Object> get errors => _errorsController.stream;

  /// 建立网络连接
  ///
  /// 参数：
  /// - uri 服务器地址
  /// - codec Protobuf 编解码器
  /// - protocols WebSocket 子协议（可选）
  /// - pingInterval 心跳间隔（可选）
  /// - pingData 心跳数据（可选）
  /// - dispatcher 消息分发器（可选）
  /// 返回值：Future（无具体数据）
  /// 异常：无（错误通过 errors 流抛出）
  Future<void> connect({
    required Uri uri,
    required ProtobufCodec codec,
    Iterable<String>? protocols,
    Duration? pingInterval,
    List<int>? pingData,
    MessageDispatcher? dispatcher,
  }) async {
    debugPrint('[SocketService] connect -> ${uri.toString()}');
    _client?.dispose();
    _client = WebSocketClient(
      uri: uri,
      codec: codec,
      protocols: protocols,
      pingInterval: pingInterval,
      pingData: pingData,
      connectTimeout: _connectTimeout,
    );

    _statusSub?.cancel();
    _msgSub?.cancel();
    _errSub?.cancel();

    _statusSub = _client!.status.listen((s) {
      status.value = s;
      debugPrint('[SocketService] status -> $s');
      if (s == ConnectionStatus.connected) {
        _startHeartbeat();
      } else {
        _stopHeartbeat();
      }
    });
    if (dispatcher == null) {
      _msgSub = _client!.messages.listen(_messagesController.add);
    } else {
      _msgSub = _client!.bytes.listen((data) {
        final pkg = dispatcher.decodePackage(data);
        for (final m in dispatcher.toSocketMessages(pkg)) {
          _messagesController.add(m);
          _handlePendingOrDispatch(m);
          final tn = (m.msgName.isNotEmpty) ? m.msgName : m.data.typeUrl;
          debugPrint('[SocketService] recv msg=$tn');
          if (tn == 'gateway.errornotify') {
            _handleGatewayError(m);
          }
        }
      });
    }
    _errSub = _client!.errors.listen((e) {
      _errorsController.add(e);
      debugPrint('[SocketService] error: $e');
      for (final h in _errorHandlers) {
        h(e);
      }
    });

    await _client!.connect();
  }

  void disconnect() {
    _client?.disconnect();
    _stopHeartbeat();
  }

  void sendBytes(List<int> data) {
    _client?.sendBytes(data);
    debugPrint('[SocketService] send bytes len=${data.length}');
  }

  void sendTyped({
    required String msgName,
    required GeneratedMessage payload,
    String? servicePath,
    String? sec,
  }) {
    debugPrint('[SocketService] send msg=$msgName');
    final any = gp_any.Any.pack(payload);
    final m = comm.SocketMessage()
      ..msgName = msgName
      ..servicePath = (servicePath ?? '')
      ..sec = (sec ?? '')
      ..data = any;
    final pkg = comm.MessagePackage()..messages.add(m);
    sendBytes(pkg.writeToBuffer());
  }

  void on(String msgName, void Function(comm.SocketMessage) handler) {
    final list = _handlers[msgName] ??= <void Function(comm.SocketMessage)>[];
    list.add(handler);
  }

  void off(String msgName, void Function(comm.SocketMessage) handler) {
    final list = _handlers[msgName];
    if (list == null) return;
    list.remove(handler);
    if (list.isEmpty) {
      _handlers.remove(msgName);
    }
  }

  void onError(void Function(Object) handler) {
    _errorHandlers.add(handler);
  }

  void offError(void Function(Object) handler) {
    _errorHandlers.remove(handler);
  }

  void _dispatch(comm.SocketMessage m) {
    final key = (m.msgName.isNotEmpty) ? m.msgName : m.data.typeUrl;
    final list = _handlers[key];
    if (list == null || list.isEmpty) return;
    for (final h in List.of(list)) {
      h(m);
    }
  }

  /// 处理 pending 请求或分发到订阅者
  ///
  /// 参数：m 收到的 SocketMessage
  /// 返回值：无
  /// 异常：无
  void _handlePendingOrDispatch(comm.SocketMessage m) {
    final key = (m.msgName.isNotEmpty) ? m.msgName : m.data.typeUrl;
    List<_PendingRequest>? q = _pending[key];
    if ((q == null || q.isEmpty) && m.data.hasTypeUrl()) {
      q = _pendingByTypeUrl[m.data.typeUrl];
    }
    if (q != null && q.isNotEmpty) {
      final p = q.removeAt(0);
      try {
        GeneratedMessage? obj;
        if (_resolver != null) {
          obj =
              _resolver!.createByMsgName(key) ??
              _resolver!.createByTypeUrl(m.data.typeUrl);
        }
        obj ??= _typeFactories[key]?.call();
        if (obj != null) {
          obj.mergeFromBuffer(m.data.value);
          p.completer.complete(obj);
        } else {
          p.completer.complete(m.data);
        }
      } catch (e) {
        p.completer.completeError(e);
      }
      if (q.isEmpty) _pending.remove(key);
      if (p.expectedTypeUrl != null) {
        final tq = _pendingByTypeUrl[p.expectedTypeUrl!];
        tq?.remove(p);
        if (tq != null && tq.isEmpty) {
          _pendingByTypeUrl.remove(p.expectedTypeUrl!);
        }
      }
      return;
    }
    _dispatch(m);
  }

  /// 发送请求并等待指定类型的回应
  ///
  /// 参数：
  /// - msgName 请求消息名
  /// - payload 请求消息体（GeneratedMessage）
  /// - decoder 回应解码函数，从二进制到对象
  /// - timeout 超时时间（可选）
  /// - onError 错误回调（可选）
  /// 返回值：Future（解码后的对象）
  /// 异常：可能抛出超时或解码异常
  Future<dynamic> request({
    required String msgName,
    required GeneratedMessage payload,
    Duration? timeout,
    void Function(Object)? onError,
  }) async {
    final c = Completer<dynamic>();
    String? expectedTypeUrl;
    try {
      GeneratedMessage? obj;
      if (_resolver != null) {
        obj = _resolver!.createByMsgName(msgName);
      }
      obj ??= _typeFactories[msgName]?.call();
      if (obj != null) {
        expectedTypeUrl = gp_any.Any.pack(obj).typeUrl;
      }
    } catch (_) {}
    final p = _PendingRequest(
      onError: onError,
      completer: c,
      expectedTypeUrl: expectedTypeUrl,
    );
    final list = _pending[msgName] ??= <_PendingRequest>[];
    list.add(p);
    if (expectedTypeUrl != null) {
      final tlist = _pendingByTypeUrl[expectedTypeUrl] ??= <_PendingRequest>[];
      tlist.add(p);
    }
    sendTyped(msgName: msgName, payload: payload);
    Timer? timer;
    if (timeout != null) {
      timer = Timer(timeout, () {
        if (!c.isCompleted) {
          final e = TimeoutException('request timeout: $msgName');
          if (onError != null) onError(e);
          c.completeError(e);
          final q = _pending[msgName];
          if (q != null) {
            q.remove(p);
            if (q.isEmpty) _pending.remove(msgName);
          }
          if (expectedTypeUrl != null) {
            final tq = _pendingByTypeUrl[expectedTypeUrl];
            if (tq != null) {
              tq.remove(p);
              if (tq.isEmpty) _pendingByTypeUrl.remove(expectedTypeUrl);
            }
          }
        }
      });
    }
    try {
      final result = await c.future;
      timer?.cancel();
      return result;
    } catch (e) {
      timer?.cancel();
      rethrow;
    }
  }

  /// 处理网关错误推送，并路由到对应请求的错误回调
  ///
  /// 参数：m 收到的 SocketMessage（应为 gateway.errornotify）
  /// 返回值：无
  /// 异常：无
  void _handleGatewayError(comm.SocketMessage m) {
    try {
      final push = gw.GatewayErrorNotifyPush.fromBuffer(m.data.value);
      final key = push.msgName;
      final q = _pending[key];
      if (q != null && q.isNotEmpty) {
        final p = q.removeAt(0);
        if (p.onError != null) p.onError!(push);
        p.completer.completeError(push);
        if (q.isEmpty) _pending.remove(key);
      }
    } catch (_) {
      // 忽略错误
    }
  }

  void setResolver(MessageResolver resolver) {
    _resolver = resolver;
  }

  void registerTypes(Map<String, GeneratedMessage Function()> factories) {
    _typeFactories.addAll(factories);
  }

  @override
  void onClose() {
    _statusSub?.cancel();
    _msgSub?.cancel();
    _errSub?.cancel();
    _client?.dispose();
    _stopHeartbeat();
    _messagesController.close();
    _errorsController.close();
    super.onClose();
  }

  void _startHeartbeat() {
    _hbTimer?.cancel();
    _hbTimer = Timer.periodic(_heartbeatInterval, (_) {
      final req = gw.GatewayHeartbeatReq();
      sendTyped(msgName: 'gateway.heartbeat', payload: req);
      debugPrint('[SocketService] heartbeat sent');
    });
  }

  void _stopHeartbeat() {
    _hbTimer?.cancel();
    _hbTimer = null;
  }
}

class _PendingRequest {
  final void Function(Object)? onError;
  final Completer<dynamic> completer;
  final String? expectedTypeUrl;

  /// 构造函数
  ///
  /// 参数：decoder 解码函数；onError 错误回调；completer 完成器
  /// 返回值：实例对象
  /// 异常：无
  _PendingRequest({
    this.onError,
    required this.completer,
    this.expectedTypeUrl,
  });
}

abstract class MessageResolver {
  GeneratedMessage? createByTypeUrl(String typeUrl);
  GeneratedMessage? createByMsgName(String msgName);
}
