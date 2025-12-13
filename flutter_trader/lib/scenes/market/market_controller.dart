import 'package:get/get.dart';

class MarketController extends GetxController {
  final categories = const [
    '全球',
    'A股',
    '港股',
    '美股',
    '期货',
    'ETF',
    '黄金',
    '可转债',
    '其他',
  ];
  final selected = 0.obs;

  /// 设置当前选中的分类下标
  ///
  /// 参数：i 当前选中的菜单下标
  /// 返回值：void（无返回）
  /// 异常：无
  void setSelected(int i) {
    selected.value = i;
  }
}
