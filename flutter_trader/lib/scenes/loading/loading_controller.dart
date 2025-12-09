import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class LoadingController extends GetxController {
  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 1200), () {
      Get.offAllNamed(AppRoutes.login);
    });
  }
}
