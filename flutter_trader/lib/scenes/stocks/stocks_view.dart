import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'stocks_controller.dart';

class StocksView extends GetView<StocksController> {
  const StocksView({super.key});

  /// 构建股票列表页面
  ///
  /// 参数：context 构建上下文
  /// 返回值：Widget（股票页面）
  /// 异常：无
  @override
  Widget build(BuildContext context) {
    final c = Get.find<StocksController>();
    return Scaffold(
      body: Obx(() {
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
            return ListTile(
              leading: const Icon(Icons.bookmark),
              title: Text(s.stockid),
              subtitle: Text('ID: ${s.hasId() ? s.id.toString() : '-'}'),
            );
          },
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: c.promptAddStock,
        icon: const Icon(Icons.add),
        label: const Text('添加股票'),
      ),
    );
  }
}
