import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../../core/cache/cache_manager.dart';
import '../../routes/app_routes.dart';
import '../../network/socket/socket_service.dart';
import '../../network/socket/websocket_client.dart';
import '../../core/config/env.dart';
import '../../network/socket/proto_codec.dart';
import '../../network/socket/message_dispatcher.dart';

class LoadingController extends GetxController {
  StreamSubscription<ConnectionStatus>? _statusSub;
  StreamSubscription<Object>? _errorSub;
  final socket = Get.find<SocketService>();
  @override
  void onReady() {
    /// 加载页面就绪时的初始化处理：
    /// - 若当前已连接，立即执行跳转逻辑
    /// - 订阅连接状态变化与错误事件
    _statusSub = socket.status.listen((s) async {
      if (s == ConnectionStatus.connected) {
        await _onConnected();
      }
    });
    _errorSub = socket.errors.listen((e) {
      Get.defaultDialog(
        title: '网络错误',
        middleText: '无法连接服务器',
        confirm: TextButton(
          onPressed: () {
            Get.back();
            _attemptConnect();
          },
          child: const Text('重试'),
        ),
      );
    });
    // 连接由 SocketBindings 初始化时触发，这里不重复发起，避免竞态
    if (socket.status.value == ConnectionStatus.connected) {
      debugPrint('[LoadingController] already connected, navigating');
      _onConnected();
    }
  }

  void _attemptConnect() {
    final url = Env.get('WS_URL');
    if (url == null || url.isEmpty) {
      return;
    }
    if (socket.status.value == ConnectionStatus.connected ||
        socket.status.value == ConnectionStatus.connecting) {
      return;
    }
    socket.connect(
      uri: Uri.parse(url),
      codec: TypeRegistryCodec({}),
      dispatcher: const MessageDispatcher(),
    );
  }

  /// 连接成功后的跳转处理
  ///
  /// 参数：无
  /// 返回值：Future（无具体数据）
  /// 异常：无
  Future<void> _onConnected() async {
    _statusSub?.cancel();
    debugPrint('[LoadingController] navigate -> login');
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onClose() {
    _statusSub?.cancel();
    _errorSub?.cancel();
    super.onClose();
  }
}
