// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Flutter Trader';

  @override
  String get homeTitle => 'Home';

  @override
  String get counterLabel => 'You have pushed the button this many times:';

  @override
  String get loadingTitle => 'Loading';

  @override
  String get loginTitle => 'Sign In';

  @override
  String get loginUsername => 'Username';

  @override
  String get loginPassword => 'Password';

  @override
  String get loginSubmit => 'Login';

  @override
  String get tabMarket => 'Market';

  @override
  String get tabStocks => 'Stocks';

  @override
  String get tabAnalysis => 'News';

  @override
  String get tabSettings => 'Settings';
}
