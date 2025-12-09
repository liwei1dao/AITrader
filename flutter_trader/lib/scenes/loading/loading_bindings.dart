import 'package:get/get.dart';
import 'loading_controller.dart';

class LoadingBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(LoadingController());
  }
}
