import 'package:get/get.dart';
// ignore_for_file: unused_import
import 'package:flutter/material.dart';

class NewsItem {
  final String title;
  final String source;
  final DateTime time;
  NewsItem(this.title, this.source, this.time);
}

class NewsController extends GetxController {
  final items = <NewsItem>[].obs;
  final loading = false.obs;

  /// 获取资讯列表（最小实现：示例数据）
  ///
  /// 参数：无
  /// 返回值：Future（无具体数据）
  /// 异常：无
  Future<void> fetch() async {
    if (loading.value) return;
    loading.value = true;
    await Future.delayed(const Duration(milliseconds: 300));
    items.assignAll([
      NewsItem('央行释放流动性，市场关注政策路径', '新华财经', DateTime.now()),
      NewsItem('美股三大指数收涨，科技股走强', 'Bloomberg', DateTime.now()),
      NewsItem('A股成交额破万亿，板块轮动加速', '东方财富', DateTime.now()),
    ]);
    loading.value = false;
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
}
