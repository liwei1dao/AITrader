import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import '../../core/cache/cache_manager.dart';
import '../../network/socket/socket_service.dart';
import '../../network/pb/user/user_msg.pb.dart' as userpb;
import '../../network/pb/user/user_db.pb.dart' as userdb;
import '../../network/pb/gateway/gateway_msg.pb.dart' as gw;

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final submitting = false.obs;
  late final SocketService _socket;

  /// 提交登录请求
  ///
  /// 参数：无
  /// 返回值：Future（无具体数据）
  /// 异常：无（错误通过对话框提示）
  Future<void> submit() async {
    if (submitting.value) return;
    final account = usernameController.text.trim();
    final password = passwordController.text.trim();
    if (account.isEmpty || password.isEmpty) {
      Get.snackbar('提示', '请输入账号和密码');
      return;
    }
    submitting.value = true;

    // 构造登录请求（最小实现：邮箱登录，密码作为验证码传入）
    final req = userpb.UserSginReq()
      ..stype = userdb.SginTyoe.Mail
      ..mail = account
      ..vcode = password;

    // 使用请求辅助：发送并接收已解码对象
    final future = _socket.request(msgName: 'user.sgin', payload: req);

    // 等待结果并处理跳转
    future
        .then((resp) async {
          if (resp is userpb.UserSginResp) {
            final token = resp.token;
            if (token.isEmpty) {
              submitting.value = false;
              Get.snackbar('登录失败', '服务器未返回令牌');
              return;
            }
            await CacheManager.setToken(token);
            submitting.value = false;
            Get.offAllNamed(AppRoutes.home);
          }
        })
        .catchError((err) {
          submitting.value = false;
          if (err is gw.GatewayErrorNotifyPush) {
            final msg = err.hasError() ? err.error.message : '网关错误';
            Get.snackbar('登录失败', msg);
          } else {
            Get.snackbar('登录失败', err.toString());
          }
        });
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    _socket = Get.find<SocketService>();
  }
}
