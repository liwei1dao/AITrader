import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../l10n/app_localizations.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(t.loginTitle),
        actions: [
          IconButton(
            onPressed: () {
              final current = Localizations.localeOf(context).languageCode;
              Get.updateLocale(current == 'zh' ? const Locale('en') : const Locale('zh'));
            },
            icon: const Icon(Icons.translate),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: controller.usernameController,
              decoration: InputDecoration(labelText: t.loginUsername),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller.passwordController,
              decoration: InputDecoration(labelText: t.loginPassword),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            Obx(() => ElevatedButton(
                  onPressed: controller.submitting.value ? null : controller.submit,
                  child: controller.submitting.value
                      ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2))
                      : Text(t.loginSubmit),
                )),
          ],
        ),
      ),
    );
  }
}
