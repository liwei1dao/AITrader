import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'stock_detail_controller.dart';
import '../../network/pb/stock/stock_db.pb.dart' as stockdb;

class StockDetailView extends GetView<StockDetailController> {
  const StockDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          final data = controller.realTimeData.value;
          return Column(
            children: [
              Text(
                data?.name ?? controller.stockId,
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                controller.stockId,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          );
        }),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: Obx(() {
        final data = controller.realTimeData.value;
        if (data == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            _buildHeader(context, data),
            const Divider(height: 1),
            _buildStatsGrid(context, data),
            const SizedBox(height: 10),
            Expanded(child: _buildChartPlaceholder(context)),
            _buildBottomBar(context),
          ],
        );
      }),
    );
  }

  Widget _buildHeader(BuildContext context, stockdb.DBStockRealTimeItem data) {
    final changePct = data.changePct;
    final changeAmt = data.changeAmt;
    final color = changePct > 0
        ? Colors.red
        : (changePct < 0 ? Colors.green : Colors.grey);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.lastPrice.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${changeAmt > 0 ? '+' : ''}${changeAmt.toStringAsFixed(2)}',
                    style: TextStyle(color: color, fontSize: 14),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${changePct > 0 ? '+' : ''}${changePct.toStringAsFixed(2)}%',
                    style: TextStyle(color: color, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          // Add more high-level info here if needed or just keep it clean like standard apps
        ],
      ),
    );
  }

  Widget _buildStatsGrid(BuildContext context, stockdb.DBStockRealTimeItem data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatItem('高', data.high.toStringAsFixed(2), Colors.red),
              _buildStatItem('开', data.open.toStringAsFixed(2), Colors.grey),
              _buildStatItem('量', _formatVolume(data.volume), Colors.black),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatItem('低', data.low.toStringAsFixed(2), Colors.green),
              _buildStatItem('换', '${data.turnoverRate.toStringAsFixed(2)}%', Colors.black),
              _buildStatItem('额', _formatAmount(data.amount), Colors.black),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return SizedBox(
      width: 100, // Fixed width for alignment
      child: Row(
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(width: 8),
          Text(value, style: TextStyle(color: color, fontSize: 12)),
        ],
      ),
    );
  }

  String _formatVolume(double volume) {
    if (volume > 100000000) {
      return '${(volume / 100000000).toStringAsFixed(2)}亿';
    } else if (volume > 10000) {
      return '${(volume / 10000).toStringAsFixed(2)}万';
    }
    return volume.toStringAsFixed(0);
  }
  
  String _formatAmount(double amount) {
     if (amount > 100000000) {
      return '${(amount / 100000000).toStringAsFixed(2)}亿';
    } else if (amount > 10000) {
      return '${(amount / 10000).toStringAsFixed(2)}万';
    }
    return amount.toStringAsFixed(0);
  }

  Widget _buildChartPlaceholder(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 40,
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text('分时', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('日K'),
                Text('周K'),
                Text('月K'),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Chart Area (Placeholder)',
                style: TextStyle(color: Colors.grey[400]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 50,
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: const Text('自选', style: TextStyle(color: Colors.black)),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.red,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('买入', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.green,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('卖出', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
