import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'stock_detail_controller.dart';

class StockDetailView extends GetView<StockDetailController> {
  const StockDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Obx(() {
          final d = controller.detail.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                d?.name ?? controller.stockId,
                style: const TextStyle(fontSize: 16),
              ),
              Text(d?.code ?? '', style: const TextStyle(fontSize: 12)),
            ],
          );
        }),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.loading.value && controller.detail.value == null) {
          return const Center(child: CircularProgressIndicator());
        }
        final d = controller.detail.value;
        if (d == null) return const Center(child: Text('暂无数据'));

        final isUp = d.changePct >= 0;
        final color = isUp ? Colors.red : Colors.green;

        return Column(
          children: [
            // Price Header
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        d.lastPrice.toStringAsFixed(2),
                        style: TextStyle(
                          color: color,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '${d.changeAmt > 0 ? '+' : ''}${d.changeAmt.toStringAsFixed(2)}',
                            style: TextStyle(color: color, fontSize: 14),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${d.changePct > 0 ? '+' : ''}${d.changePct.toStringAsFixed(2)}%',
                            style: TextStyle(color: color, fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // High/Low/Open Grid
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        children: [
                          _buildRow(
                            '高',
                            d.high.toStringAsFixed(2),
                            '开',
                            d.open.toStringAsFixed(2),
                          ),
                          _buildRow(
                            '低',
                            d.low.toStringAsFixed(2),
                            '换',
                            '${d.turnoverRate.toStringAsFixed(2)}%',
                          ),
                          _buildRow(
                            '量',
                            '${(d.volume / 10000).toStringAsFixed(2)}万',
                            '额',
                            '${(d.amount / 100000000).toStringAsFixed(2)}亿',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            // Chart Placeholder
            Expanded(
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    '分时图 / K线图 (待实现)',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                ),
              ),
            ),
            // Bottom Tabs Placeholder
            Container(
              height: 50,
              color: Colors.grey[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text('新闻'),
                  Text('资金'),
                  Text('F10'),
                  Text('公告'),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildRow(String label1, String val1, String label2, String val2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                label1,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(width: 4),
              Text(val1, style: const TextStyle(fontSize: 12)),
            ],
          ),
          Row(
            children: [
              Text(
                label2,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(width: 4),
              Text(val2, style: const TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
