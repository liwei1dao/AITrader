import 'package:get/get.dart';
import '../news/news_controller.dart';

class HomeController extends GetxController {
  final index = 0.obs;
  void setIndex(int i) {
    index.value = i;
    if (i == 2) {
      final news = Get.find<NewsController>();
      if (news.items.isEmpty) {
        news.fetch();
      }
    }
  }
}
