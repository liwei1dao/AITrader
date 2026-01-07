import 'dart:async';
import 'package:get/get.dart';
import '../../network/socket/socket_service.dart';
import '../../network/pb/stock/stock_msg.pb.dart' as stockpb;
import '../../network/pb/stock/stock_db.pb.dart' as stockdb;

class StockDetailController extends GetxController {
  late final String stockId;
  final detail = Rxn<stockdb.DBStockRealTimeItem>();
  final loading = false.obs;
  late final SocketService _socket;
  Timer? _refreshTimer;

  @override
  void onInit() {
    super.onInit();
    _socket = Get.find<SocketService>();
    stockId = Get.arguments['stockId'] ?? '';
  }

  @override
  void onReady() {
    super.onReady();
    if (stockId.isNotEmpty) {
      fetchDetail();
      _startAutoRefresh();
    }
  }

  @override
  void onClose() {
    _stopAutoRefresh();
    super.onClose();
  }

  Future<void> fetchDetail() async {
    if (detail.value == null) loading.value = true;
    
    final req = stockpb.StockGetRealTimeDataReq(codes: [stockId]);
    try {
      final resp = await _socket.request(
        msgName: 'stock.getrealtimedata', 
        payload: req
      );
      if (resp is stockpb.StockGetRealTimeDataResp && resp.items.isNotEmpty) {
        detail.value = resp.items.first;
      }
    } catch (e) {
      print('Fetch detail error: $e');
    } finally {
      loading.value = false;
    }
  }

  void _startAutoRefresh() {
    _refreshTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      fetchDetail();
    });
  }

  void _stopAutoRefresh() {
    _refreshTimer?.cancel();
  }
}
