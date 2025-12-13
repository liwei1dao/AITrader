import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'market_controller.dart';
import 'pages/global_page.dart';
import 'pages/a_share_page.dart';
import 'pages/hk_page.dart';
import 'pages/us_page.dart';
import 'pages/futures_page.dart';
import 'pages/etf_page.dart';
import 'pages/gold_page.dart';
import 'pages/convertible_bond_page.dart';
import 'pages/others_page.dart';

class MarketView extends GetView<MarketController> {
  const MarketView({super.key});

  /// 构建行情场景主界面
  ///
  /// 参数：context 构建上下文
  /// 返回值：Widget（行情页面）
  /// 异常：无
  @override
  Widget build(BuildContext context) {
    final c = Get.find<MarketController>();
    return DefaultTabController(
      length: c.categories.length,
      initialIndex: c.selected.value,
      child: Column(
        children: [
          Material(
            color: Theme.of(context).colorScheme.surface,
            child: TabBar(
              isScrollable: true,
              onTap: c.setSelected,
              tabs: c.categories.map((e) => Tab(text: e)).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: const [
                MarketGlobalPage(),
                MarketASharePage(),
                MarketHKPage(),
                MarketUSPage(),
                MarketFuturesPage(),
                MarketETFPage(),
                MarketGoldPage(),
                MarketConvertibleBondPage(),
                MarketOthersPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
