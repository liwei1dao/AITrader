import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:math';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter/foundation.dart';
import 'proto_codec.dart';

enum ConnectionStatus { disconnected, connecting, connected }

class WebSocketClient {
  final Uri uri;
  final ProtobufCodec codec;
  final Iterable<String>? protocols;
  final bool autoReconnect;
  final Duration initialReconnectDelay;
  final Duration maxReconnectDelay;
  final int maxBufferBytes;
  final Duration? pingInterval;
  final List<int>? pingData;
  final Duration? connectTimeout;

  WebSocketChannel? _channel;
  StreamSubscription? _subscription;
  Timer? _pingTimer;
  Timer? _connectTimer;
  int _attempt = 0;
  bool _manualClose = false;

  final _statusController = StreamController<ConnectionStatus>.broadcast();
  final _bytesController = StreamController<List<int>>.broadcast();
  final _messagesController = StreamController<dynamic>.broadcast();
  final _errorsController = StreamController<Object>.broadcast();
  final Queue<List<int>> _buffer = Queue<List<int>>();
  int _bufferSize = 0;

  WebSocketClient({
    required this.uri,
    required this.codec,
    this.protocols,
    this.autoReconnect = true,
    this.initialReconnectDelay = const Duration(milliseconds: 500),
    this.maxReconnectDelay = const Duration(seconds: 10),
    this.maxBufferBytes = 1024 * 1024,
    this.pingInterval,
    this.pingData,
    this.connectTimeout,
  });

  Stream<ConnectionStatus> get status => _statusController.stream;
  Stream<List<int>> get bytes => _bytesController.stream;
  Stream<dynamic> get messages => _messagesController.stream;
  Stream<Object> get errors => _errorsController.stream;

  bool get isConnected => _channel != null;

  /// 建立连接，支持连接超时
  ///
  /// 参数：无
  /// 返回值：Future（无具体数据）
  /// 异常：无（错误通过 errors 流抛出）
  Future<void> connect() async {
    if (isConnected) return;
    _manualClose = false;
    _statusController.add(ConnectionStatus.connecting);
    debugPrint('[WS] connecting -> ${uri.toString()}');
    _startConnectTimeout();
    await _open();
  }

  /// 断开连接
  ///
  /// 参数：code 关闭代码；reason 关闭原因
  /// 返回值：无
  /// 异常：无
  void disconnect([int code = 1000, String reason = '']) {
    _manualClose = true;
    _cancelPing();
    _cancelConnectTimeout();
    _subscription?.cancel();
    _subscription = null;
    _channel?.sink.close(code, reason);
    _channel = null;
    _statusController.add(ConnectionStatus.disconnected);
    debugPrint('[WS] disconnected code=$code reason=$reason');
  }

  void sendBytes(List<int> data) {
    if (isConnected) {
      _channel!.sink.add(data);
      debugPrint('[WS] send bytes len=${data.length}');
    } else {
      _enqueue(data);
      debugPrint('[WS] buffer bytes len=${data.length} (queued)');
    }
  }

  void sendMessage(dynamic message) {
    if (message is List<int>) {
      sendBytes(message);
    } else {
      sendBytes(codec.encode(message));
    }
  }

  /// 打开底层连接并监听数据
  ///
  /// 参数：无
  /// 返回值：Future（无具体数据）
  /// 异常：无（错误通过 errors 流抛出）
  Future<void> _open() async {
    try {
      _channel = WebSocketChannel.connect(uri, protocols: protocols);
      _attempt = 0;
      _statusController.add(ConnectionStatus.connected);
      debugPrint('[WS] connected');
      _cancelConnectTimeout();
      _drainBuffer();
      _startPing();
      _subscription = _channel!.stream.listen(
        (event) {
          final data = event is String
              ? utf8.encode(event)
              : (event as List<int>);
          _bytesController.add(data);
          debugPrint('[WS] recv bytes len=${data.length}');
          final decoded = codec.decode(data);
          _messagesController.add(decoded ?? data);
        },
        onDone: () {
          _cancelPing();
          _cancelConnectTimeout();
          _channel = null;
          _statusController.add(ConnectionStatus.disconnected);
          debugPrint('[WS] stream done -> disconnected');
          if (!_manualClose && autoReconnect) _scheduleReconnect();
        },
        onError: (e, _) {
          _errorsController.add(e);
          _cancelPing();
          _cancelConnectTimeout();
          _channel = null;
          _statusController.add(ConnectionStatus.disconnected);
          debugPrint('[WS] error: $e');
          if (!_manualClose && autoReconnect) _scheduleReconnect();
        },
        cancelOnError: false,
      );
    } catch (e) {
      _errorsController.add(e);
      _cancelConnectTimeout();
      _channel = null;
      _statusController.add(ConnectionStatus.disconnected);
      debugPrint('[WS] connect failed: $e');
      if (!_manualClose && autoReconnect) _scheduleReconnect();
    }
  }

  void _scheduleReconnect() {
    _attempt += 1;
    final delayMs = min(
      maxReconnectDelay.inMilliseconds,
      initialReconnectDelay.inMilliseconds * (1 << _attempt),
    ).toInt();
    Future.delayed(Duration(milliseconds: delayMs), () {
      if (!_manualClose) _open();
    });
  }

  void _enqueue(List<int> data) {
    if (_bufferSize + data.length > maxBufferBytes) return;
    final copy = Uint8List.fromList(data);
    _buffer.add(copy);
    _bufferSize += copy.length;
  }

  void _drainBuffer() {
    while (_buffer.isNotEmpty && isConnected) {
      final data = _buffer.removeFirst();
      _bufferSize -= data.length;
      _channel!.sink.add(data);
    }
  }

  void _startPing() {
    if (pingInterval == null) return;
    _pingTimer?.cancel();
    _pingTimer = Timer.periodic(pingInterval!, (_) {
      final data = pingData ?? const [0];
      if (isConnected) _channel!.sink.add(data);
    });
  }

  void _cancelPing() {
    _pingTimer?.cancel();
    _pingTimer = null;
  }

  /// 启动连接超时计时器
  ///
  /// 参数：无
  /// 返回值：无
  /// 异常：无
  void _startConnectTimeout() {
    if (connectTimeout == null) return;
    _connectTimer?.cancel();
    _connectTimer = Timer(connectTimeout!, () {
      if (!isConnected) {
        final e = TimeoutException(
          'connect timeout after ${connectTimeout!.inMilliseconds}ms',
        );
        _errorsController.add(e);
        _statusController.add(ConnectionStatus.disconnected);
        debugPrint('[WS] connect timeout');
        if (!_manualClose && autoReconnect) _scheduleReconnect();
      }
    });
  }

  /// 取消连接超时计时器
  ///
  /// 参数：无
  /// 返回值：无
  /// 异常：无
  void _cancelConnectTimeout() {
    _connectTimer?.cancel();
    _connectTimer = null;
  }

  void dispose() {
    disconnect();
    _statusController.close();
    _bytesController.close();
    _messagesController.close();
    _errorsController.close();
  }
}
