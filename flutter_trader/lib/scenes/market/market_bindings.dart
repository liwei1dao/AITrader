import 'package:get/get.dart';
import '../home/home_controller.dart';
import 'market_controller.dart';
import '../../routes/app_routes.dart';

class MarketBindings implements Bindings {
  /// 注册行情相关依赖
  ///
  /// 参数：无
  /// 返回值：void（无返回）
  /// 异常：无
  @override
  void dependencies() {
    final hc = Get.isRegistered<HomeController>()
        ? Get.find<HomeController>()
        : Get.put(HomeController());
    final mc = Get.isRegistered<MarketController>()
        ? Get.find<MarketController>()
        : Get.put(MarketController());
    hc.setIndex(0);
    final route = Get.currentRoute;
    if (route == AppRoutes.marketGlobal) {
      mc.setSelected(0);
    } else if (route == AppRoutes.marketAShare) {
      mc.setSelected(1);
    } else if (route == AppRoutes.marketUS) {
      mc.setSelected(3);
    }
  }
}
