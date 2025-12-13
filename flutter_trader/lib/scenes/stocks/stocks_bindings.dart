import 'package:get/get.dart';
import '../home/home_controller.dart';
import 'stocks_controller.dart';

class StocksBindings implements Bindings {
  /// 注册股票场景相关依赖
  ///
  /// 参数：无
  /// 返回值：void（无返回）
  /// 异常：无
  @override
  void dependencies() {
    final hc = Get.isRegistered<HomeController>()
        ? Get.find<HomeController>()
        : Get.put(HomeController());
    Get.isRegistered<StocksController>()
        ? Get.find<StocksController>()
        : Get.put(StocksController());
    hc.setIndex(1);
  }
}
