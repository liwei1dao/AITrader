import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../l10n/app_localizations.dart';
import 'home_controller.dart';
import '../market/market_view.dart';
import '../stocks/stocks_view.dart';
import '../news/news_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Obx(() {
      final i = controller.index.value;
      return Scaffold(
        appBar: AppBar(
          title: Text(
            [t.tabMarket, t.tabStocks, t.tabAnalysis, t.tabSettings][i],
          ),
          actions: [
            IconButton(
              onPressed: () {
                final current = Localizations.localeOf(context).languageCode;
                Get.updateLocale(
                  current == 'zh' ? const Locale('en') : const Locale('zh'),
                );
              },
              icon: const Icon(Icons.translate),
            ),
          ],
        ),
        body: IndexedStack(
          index: i,
          children: const [
            MarketView(),
            StocksView(),
            NewsView(),
            Center(child: Text('Settings')),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: i,
          onTap: controller.setIndex,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.trending_up),
              label: t.tabMarket,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.show_chart),
              label: t.tabStocks,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.analytics),
              label: t.tabAnalysis,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: t.tabSettings,
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      );
    });
  }
}
