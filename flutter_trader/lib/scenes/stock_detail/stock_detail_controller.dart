import 'dart:async';
import 'package:get/get.dart';
import '../../network/socket/socket_service.dart';
import '../../network/pb/stock/stock_msg.pb.dart' as stockmsg;
import '../../network/pb/stock/stock_db.pb.dart' as stockdb;

class StockDetailController extends GetxController {
  late final SocketService _socket;
  late final String stockId;
  final realTimeData = Rxn<stockdb.DBStockRealTimeItem>();
  final loading = false.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _socket = Get.find<SocketService>();
    stockId = Get.arguments as String;
  }

  @override
  void onReady() {
    super.onReady();
    _startRealTimeUpdates();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void _startRealTimeUpdates() {
    _timer?.cancel();
    _fetchRealTimeData();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      _fetchRealTimeData();
    });
  }

  void _fetchRealTimeData() {
    final req = stockmsg.StockGetRealTimeDataReq(codes: [stockId]);
    _socket.request(msgName: 'stock.getrealtimedata', payload: req).then((resp) {
      if (resp is stockmsg.StockGetRealTimeDataResp && resp.items.isNotEmpty) {
        realTimeData.value = resp.items.first;
      }
    });
  }
}
