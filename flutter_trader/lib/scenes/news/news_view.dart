import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'news_controller.dart';

class NewsView extends GetView<NewsController> {
  const NewsView({super.key});

  /// 构建资讯页面
  ///
  /// 参数：context 构建上下文
  /// 返回值：Widget（资讯列表页面）
  /// 异常：无
  @override
  Widget build(BuildContext context) {
    final c = Get.find<NewsController>();
    return Scaffold(
      body: Obx(() {
        if (c.loading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (c.items.isEmpty) {
          return Center(
            child: Text(
              '暂无资讯',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        }
        return ListView.separated(
          itemCount: c.items.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final n = c.items[index];
            return ListTile(
              title: Text(n.title),
              subtitle: Text('${n.source} • ${_fmt(n.time)}'),
            );
          },
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            onPressed: c.fetch,
            icon: const Icon(Icons.refresh),
            label: const Text('刷新'),
          ),
          const SizedBox(width: 12),
          FloatingActionButton.extended(
            onPressed: c.clear,
            icon: const Icon(Icons.clear_all),
            label: const Text('清空'),
          ),
        ],
      ),
    );
  }

  /// 格式化时间
  ///
  /// 参数：t 时间
  /// 返回值：String（hh:mm 格式）
  /// 异常：无
  String _fmt(DateTime t) {
    final h = t.hour.toString().padLeft(2, '0');
    final m = t.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }
}
