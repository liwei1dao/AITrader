import 'package:get/get.dart';
import '../scenes/loading/loading_view.dart';
import '../scenes/loading/loading_bindings.dart';
import '../scenes/login/login_view.dart';
import '../scenes/login/login_bindings.dart';
import '../scenes/home/home_view.dart';
import '../scenes/home/home_bindings.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = <GetPage<dynamic>>[
    GetPage(name: AppRoutes.loading, page: LoadingView.new, binding: LoadingBindings()),
    GetPage(name: AppRoutes.login, page: LoginView.new, binding: LoginBindings()),
    GetPage(name: AppRoutes.home, page: HomeView.new, binding: HomeBindings()),
  ];
}
