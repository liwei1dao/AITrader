import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../l10n/app_localizations.dart';
import 'loading_controller.dart';

class LoadingView extends GetView<LoadingController> {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(t.loadingTitle),
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
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}
