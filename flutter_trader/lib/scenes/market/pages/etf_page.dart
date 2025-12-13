import 'package:flutter/material.dart';

class MarketETFPage extends StatelessWidget {
  const MarketETFPage({super.key});

  /// 构建 ETF 市场页面
  ///
  /// 参数：context 构建上下文
  /// 返回值：Widget（页面内容）
  /// 异常：无
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'ETF 页面',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
