import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/config/env.dart';
import 'network/socket/socket_bindings.dart';
import 'l10n/app_localizations.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

const String _envName = String.fromEnvironment(
  'ENV',
  defaultValue: 'development',
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.init(_envName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.loading,
      initialBinding: SocketBindings(),
      getPages: AppPages.pages,
    );
  }
}
