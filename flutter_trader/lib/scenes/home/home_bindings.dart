import 'package:get/get.dart';
import 'home_controller.dart';
import '../market/market_controller.dart';
import '../../routes/app_routes.dart';
import '../stocks/stocks_controller.dart';
import '../news/news_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    final hc = Get.put(HomeController());
    final mc = Get.put(MarketController());
    Get.put(StocksController());
    Get.put(NewsController());
    final route = Get.currentRoute;
    if (route == AppRoutes.marketGlobal) {
      hc.setIndex(0);
      mc.setSelected(0);
    } else if (route == AppRoutes.marketAShare) {
      hc.setIndex(0);
      mc.setSelected(1);
    } else if (route == AppRoutes.marketUS) {
      hc.setIndex(0);
      mc.setSelected(3);
    }
  }
}
