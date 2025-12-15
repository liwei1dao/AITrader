// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '交易应用';

  @override
  String get homeTitle => '首页';

  @override
  String get counterLabel => '你已经点击按钮的次数：';

  @override
  String get loadingTitle => '加载中';

  @override
  String get loginTitle => '登录';

  @override
  String get loginUsername => '用户名';

  @override
  String get loginPassword => '密码';

  @override
  String get loginSubmit => '登录';

  @override
  String get tabMarket => '行情';

  @override
  String get tabStocks => '股票';

  @override
  String get tabAnalysis => '资讯';

  @override
  String get tabSettings => '设置';
}
