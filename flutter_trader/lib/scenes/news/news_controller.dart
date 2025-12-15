import 'package:get/get.dart';
import '../../network/socket/socket_service.dart';
import 'package:flutter_trader/network/pb/news/news_msg.pb.dart' as nmsg;
import '../../network/pb/gateway/gateway_msg.pb.dart' as gw;

class NewsItem {
  final String title;
  final String source;
  final DateTime time;
  NewsItem(this.title, this.source, this.time);
}

class NewsController extends GetxController {
  final items = <NewsItem>[].obs;
  final loading = false.obs;
  late final SocketService _socket;

  /// 获取资讯列表（最小实现：示例数据）
  ///
  /// 参数：无
  /// 返回值：Future（无具体数据）
  /// 异常：无
  Future<void> fetch() async {
    if (loading.value) return;
    loading.value = true;
    final req = nmsg.NewsMarketNewsReq();
    final future = _socket.request(msgName: 'news.marketnews', payload: req);
    future.then((resp) {
      loading.value = false;
      if (resp is nmsg.NewsMarketNewsResp) {
        final list = resp.news.map((e) {
          final t = _parseTime(e.pubTime);
          final title = e.summary.isNotEmpty ? e.summary : (e.tag.isNotEmpty ? e.tag : '新闻');
          final source = e.tag.isNotEmpty ? e.tag : '资讯';
          return NewsItem(title, source, t);
        }).toList();
        items.assignAll(list);
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

  /// 清空资讯列表
  ///
  /// 参数：无
  /// 返回值：void（无返回）
  /// 异常：无
  void clear() {
    items.clear();
  }

  @override
  void onReady() {
    super.onReady();
    fetch();
  }

  /// 解析时间字符串为 DateTime
  ///
  /// 参数：s 时间字符串
  /// 返回值：DateTime（解析失败时返回当前时间）
  /// 异常：无
  DateTime _parseTime(String s) {
    try {
      return DateTime.parse(s);
    } catch (_) {
      return DateTime.now();
    }
  }

  @override
  void onInit() {
    super.onInit();
    _socket = Get.find<SocketService>();
  }
}
