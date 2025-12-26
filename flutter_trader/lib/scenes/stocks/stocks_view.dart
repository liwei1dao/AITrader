import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'stocks_controller.dart';
import '../../routes/app_routes.dart';
import '../../network/pb/stock/stock_db.pb.dart' as stockdb;

class StocksView extends GetView<StocksController> {
  const StocksView({super.key});

  /// 构建股票列表页面（嵌入 Home 的 Scaffold，不再嵌套 Scaffold）
  ///
  /// 参数：context 构建上下文
  /// 返回值：Widget（股票页面内容）
  /// 异常：无
  @override
  Widget build(BuildContext context) {
    final c = Get.find<StocksController>();
    return Stack(
      children: [
        Obx(() {
          // 监听实时数据变化
          c.realTimeData.length;

          if (c.loading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (c.stocks.isEmpty) {
            return Center(
              child: Text(
                '暂无股票，点击下方按钮添加',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }
          return ListView.builder(
            itemCount: c.stocks.length,
            itemBuilder: (context, index) {
              final s = c.stocks[index];
              final realTime = c.realTimeData[s.stockid];

              String title = s.stockid;
              String subtitle = 'ID: ${s.hasId() ? s.id.toString() : '-'}';
              String priceText = '--';
              String changeText = '--%';
              Color priceColor = Colors.grey;

              if (realTime != null) {
                title = '${realTime.name} (${s.stockid})';
                priceText = realTime.lastPrice.toStringAsFixed(2);
                final changePct = realTime.changePct;
                changeText =
                    '${changePct > 0 ? '+' : ''}${changePct.toStringAsFixed(2)}%';

                if (changePct > 0) {
                  priceColor = Colors.red;
                } else if (changePct < 0) {
                  priceColor = Colors.green;
                }
              }

              return ListTile(
                leading: const Icon(Icons.show_chart),
                title: Text(title),
                subtitle: Text(subtitle),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      priceText,
                      style: TextStyle(
                        color: priceColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      changeText,
                      style: TextStyle(color: priceColor, fontSize: 12),
                    ),
                  ],
                ),
              );
            },
          );
        }),
        SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: FloatingActionButton.extended(
                heroTag: 'stocks_add',
                onPressed: c.promptAddStock,
                icon: const Icon(Icons.add),
                label: const Text('添加股票'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
