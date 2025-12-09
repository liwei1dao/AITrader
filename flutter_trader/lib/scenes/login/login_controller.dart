import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final submitting = false.obs;

  Future<void> submit() async {
    if (submitting.value) return;
    submitting.value = true;
    await Future.delayed(const Duration(milliseconds: 500));
    Get.offAllNamed(AppRoutes.home);
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
