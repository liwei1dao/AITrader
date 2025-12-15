import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../network/socket/socket_service.dart';
import '../../network/pb/user/user_msg.pb.dart' as userpb;
import '../../network/pb/user/user_db.pb.dart' as userdb;
import '../../network/pb/gateway/gateway_msg.pb.dart' as gw;
import 'package:fixnum/fixnum.dart' as fixnum;

class StocksController extends GetxController {
  final stocks = <userdb.DBUserStock>[].obs;
  final loading = false.obs;
  late final SocketService _socket;

  /// 获取用户股票列表
  ///
  /// 参数：无
  /// 返回值：Future（无具体数据）
  /// 异常：无（错误通过弹窗提示）
  Future<void> fetchStocks() async {
    if (loading.value) return;
    loading.value = true;
    final req = userpb.UserGetStocksReq();
    final future = _socket.request(msgName: 'user.getstocks', payload: req);
    future
        .then((resp) {
          loading.value = false;
          if (resp is userpb.UserGetStocksResp) {
            stocks.assignAll(resp.stocks);
          }
        })
        .catchError((err) {
          loading.value = false;
          if (err is gw.GatewayErrorNotifyPush) {
            Get.snackbar('错误', err.hasError() ? err.error.message : '网关错误');
          } else {
            Get.snackbar('错误', err.toString());
          }
        });
  }

  /// 添加股票
  ///
  /// 参数：stockId 股票代码；costPrice 成本价（放大100后的整数）；amount 购买数量（整数）
  /// 返回值：Future（无具体数据）
  /// 异常：无（错误通过弹窗提示）
  Future<void> addStock({
    required String stockId,
    required int costPrice,
    required int amount,
  }) async {
    if (stockId.isEmpty) return;
    final req = userpb.UserAddStockReq()
      ..stock = (userdb.DBUserStock()
        ..stockid = stockId
        ..costprice = costPrice
        ..amount = fixnum.Int64(amount));
    final future = _socket.request(msgName: 'user.addstock', payload: req);
    future
        .then((resp) {
          if (resp is userpb.UserAddStockResp && resp.hasStock()) {
            stocks.add(resp.stock);
          }
        })
        .catchError((err) {
          if (err is gw.GatewayErrorNotifyPush) {
            Get.snackbar('添加失败', err.hasError() ? err.error.message : '网关错误');
          } else {
            Get.snackbar('添加失败', err.toString());
          }
        });
  }

  /// 弹出输入框添加股票
  ///
  /// 参数：无
  /// 返回值：void（无返回）
  /// 异常：无
  void promptAddStock() {
    final codeController = TextEditingController();
    final priceController = TextEditingController();
    final amountController = TextEditingController();
    Get.defaultDialog(
      title: '添加股票',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: codeController,
              decoration: const InputDecoration(hintText: '股票代码'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              controller: priceController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(hintText: '成本价（支持小数，如 12.34）'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: '购买数量（整数）'),
            ),
          ),
        ],
      ),
      textConfirm: '提交',
      textCancel: '取消',
      onConfirm: () {
        final code = codeController.text.trim();
        final priceStr = priceController.text.trim();
        final amountStr = amountController.text.trim();
        final price = double.tryParse(priceStr) ?? 0.0;
        final amount = int.tryParse(amountStr) ?? 0;
        final scaledPrice = (price * 100).round();
        if (code.isEmpty || scaledPrice <= 0 || amount <= 0) {
          Get.snackbar('提示', '请正确填写代码、价格和数量');
          return;
        }
        Get.back();
        addStock(stockId: code, costPrice: scaledPrice, amount: amount);
      },
      onCancel: () {},
    );
  }

  @override
  void onReady() {
    super.onReady();
    fetchStocks();
  }

  @override
  void onInit() {
    super.onInit();
    _socket = Get.find<SocketService>();
  }
}
