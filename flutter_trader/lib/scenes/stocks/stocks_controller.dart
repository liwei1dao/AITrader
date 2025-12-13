import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../network/socket/socket_service.dart';
import '../../network/pb/user/user_msg.pb.dart' as userpb;
import '../../network/pb/user/user_db.pb.dart' as userdb;
import '../../network/pb/gateway/gateway_msg.pb.dart' as gw;

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
    future.then((resp) {
      loading.value = false;
      if (resp is userpb.UserGetStocksResp) {
        stocks.assignAll(resp.stocks);
      }
    }).catchError((err) {
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
  /// 参数：stockId 股票ID或代码
  /// 返回值：Future（无具体数据）
  /// 异常：无（错误通过弹窗提示）
  Future<void> addStock(String stockId) async {
    if (stockId.isEmpty) return;
    final req = userpb.UserAddStockReq()
      ..stock = (userdb.DBUserStock()..stockid = stockId);
    final future = _socket.request(msgName: 'user.addstock', payload: req);
    future.then((resp) {
      if (resp is userpb.UserAddStockResp && resp.hasStock()) {
        stocks.add(resp.stock);
      }
    }).catchError((err) {
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
    final controller = TextEditingController();
    Get.defaultDialog(
      title: '添加股票',
      content: Padding(
        padding: const EdgeInsets.all(8),
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: '请输入股票ID/代码'),
        ),
      ),
      textConfirm: '添加',
      textCancel: '取消',
      onConfirm: () {
        final id = controller.text.trim();
        Get.back();
        addStock(id);
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
