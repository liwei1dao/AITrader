import 'dart:async';
import 'package:get/get.dart';
import '../../core/cache/cache_manager.dart';
import '../../routes/app_routes.dart';
import '../../network/socket/socket_service.dart';
import '../../network/socket/websocket_client.dart';

class LoadingController extends GetxController {
  StreamSubscription<ConnectionStatus>? _statusSub;

  @override
  void onReady() {
    final socket = Get.find<SocketService>();
    _statusSub = socket.status.listen((s) async {
      if (s == ConnectionStatus.connected) {
        await _onConnected();
      }
    });
  }

  Future<void> _onConnected() async {
    _statusSub?.cancel();
    final token = CacheManager.token;
    if (token == null || token.isEmpty) {
      Get.offAllNamed(AppRoutes.login);
      return;
    }
    Get.offAllNamed(AppRoutes.home);
  }

  @override
  void onClose() {
    _statusSub?.cancel();
    super.onClose();
  }
}
