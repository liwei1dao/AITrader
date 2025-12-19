// This is a generated file - do not edit.
//
// Generated from market/market_db.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

///
/// 市场实时指数数据
class DBMarketIndexRealTimeItem extends $pb.GeneratedMessage {
  factory DBMarketIndexRealTimeItem({
    $fixnum.Int64? index,
    $core.String? code,
    $core.String? name,
    $core.double? lastPrice,
    $core.double? changePct,
    $core.double? changeAmt,
    $core.double? volume,
    $core.double? amount,
    $core.double? amplitude,
    $core.double? high,
    $core.double? low,
    $core.double? open,
    $core.double? prevClose,
    $core.double? volumeRatio,
    $core.double? turnoverRate,
    $core.double? peDynamic,
    $core.double? pbRatio,
    $core.double? totalMarketCap,
    $core.double? circulatingMarketCap,
    $core.double? priceSpeed,
    $core.double? fiveMinChange,
    $core.double? sixtyDayChangePct,
    $core.double? ytdChangePct,
  }) {
    final result = create();
    if (index != null) result.index = index;
    if (code != null) result.code = code;
    if (name != null) result.name = name;
    if (lastPrice != null) result.lastPrice = lastPrice;
    if (changePct != null) result.changePct = changePct;
    if (changeAmt != null) result.changeAmt = changeAmt;
    if (volume != null) result.volume = volume;
    if (amount != null) result.amount = amount;
    if (amplitude != null) result.amplitude = amplitude;
    if (high != null) result.high = high;
    if (low != null) result.low = low;
    if (open != null) result.open = open;
    if (prevClose != null) result.prevClose = prevClose;
    if (volumeRatio != null) result.volumeRatio = volumeRatio;
    if (turnoverRate != null) result.turnoverRate = turnoverRate;
    if (peDynamic != null) result.peDynamic = peDynamic;
    if (pbRatio != null) result.pbRatio = pbRatio;
    if (totalMarketCap != null) result.totalMarketCap = totalMarketCap;
    if (circulatingMarketCap != null)
      result.circulatingMarketCap = circulatingMarketCap;
    if (priceSpeed != null) result.priceSpeed = priceSpeed;
    if (fiveMinChange != null) result.fiveMinChange = fiveMinChange;
    if (sixtyDayChangePct != null) result.sixtyDayChangePct = sixtyDayChangePct;
    if (ytdChangePct != null) result.ytdChangePct = ytdChangePct;
    return result;
  }

  DBMarketIndexRealTimeItem._();

  factory DBMarketIndexRealTimeItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DBMarketIndexRealTimeItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DBMarketIndexRealTimeItem',
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'index')
    ..aOS(2, _omitFieldNames ? '' : 'code')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aD(4, _omitFieldNames ? '' : 'lastPrice')
    ..aD(5, _omitFieldNames ? '' : 'changePct')
    ..aD(6, _omitFieldNames ? '' : 'changeAmt')
    ..aD(7, _omitFieldNames ? '' : 'volume')
    ..aD(8, _omitFieldNames ? '' : 'amount')
    ..aD(9, _omitFieldNames ? '' : 'amplitude')
    ..aD(10, _omitFieldNames ? '' : 'high')
    ..aD(11, _omitFieldNames ? '' : 'low')
    ..aD(12, _omitFieldNames ? '' : 'open')
    ..aD(13, _omitFieldNames ? '' : 'prevClose')
    ..aD(14, _omitFieldNames ? '' : 'volumeRatio')
    ..aD(15, _omitFieldNames ? '' : 'turnoverRate')
    ..aD(16, _omitFieldNames ? '' : 'peDynamic')
    ..aD(17, _omitFieldNames ? '' : 'pbRatio')
    ..aD(18, _omitFieldNames ? '' : 'totalMarketCap')
    ..aD(19, _omitFieldNames ? '' : 'circulatingMarketCap')
    ..aD(20, _omitFieldNames ? '' : 'priceSpeed')
    ..aD(21, _omitFieldNames ? '' : 'fiveMinChange')
    ..aD(22, _omitFieldNames ? '' : 'sixtyDayChangePct')
    ..aD(23, _omitFieldNames ? '' : 'ytdChangePct')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DBMarketIndexRealTimeItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DBMarketIndexRealTimeItem copyWith(
          void Function(DBMarketIndexRealTimeItem) updates) =>
      super.copyWith((message) => updates(message as DBMarketIndexRealTimeItem))
          as DBMarketIndexRealTimeItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DBMarketIndexRealTimeItem create() => DBMarketIndexRealTimeItem._();
  @$core.override
  DBMarketIndexRealTimeItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DBMarketIndexRealTimeItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DBMarketIndexRealTimeItem>(create);
  static DBMarketIndexRealTimeItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get index => $_getI64(0);
  @$pb.TagNumber(1)
  set index($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndex() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get lastPrice => $_getN(3);
  @$pb.TagNumber(4)
  set lastPrice($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLastPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastPrice() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get changePct => $_getN(4);
  @$pb.TagNumber(5)
  set changePct($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasChangePct() => $_has(4);
  @$pb.TagNumber(5)
  void clearChangePct() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get changeAmt => $_getN(5);
  @$pb.TagNumber(6)
  set changeAmt($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasChangeAmt() => $_has(5);
  @$pb.TagNumber(6)
  void clearChangeAmt() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.double get volume => $_getN(6);
  @$pb.TagNumber(7)
  set volume($core.double value) => $_setDouble(6, value);
  @$pb.TagNumber(7)
  $core.bool hasVolume() => $_has(6);
  @$pb.TagNumber(7)
  void clearVolume() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.double get amount => $_getN(7);
  @$pb.TagNumber(8)
  set amount($core.double value) => $_setDouble(7, value);
  @$pb.TagNumber(8)
  $core.bool hasAmount() => $_has(7);
  @$pb.TagNumber(8)
  void clearAmount() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.double get amplitude => $_getN(8);
  @$pb.TagNumber(9)
  set amplitude($core.double value) => $_setDouble(8, value);
  @$pb.TagNumber(9)
  $core.bool hasAmplitude() => $_has(8);
  @$pb.TagNumber(9)
  void clearAmplitude() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.double get high => $_getN(9);
  @$pb.TagNumber(10)
  set high($core.double value) => $_setDouble(9, value);
  @$pb.TagNumber(10)
  $core.bool hasHigh() => $_has(9);
  @$pb.TagNumber(10)
  void clearHigh() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.double get low => $_getN(10);
  @$pb.TagNumber(11)
  set low($core.double value) => $_setDouble(10, value);
  @$pb.TagNumber(11)
  $core.bool hasLow() => $_has(10);
  @$pb.TagNumber(11)
  void clearLow() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.double get open => $_getN(11);
  @$pb.TagNumber(12)
  set open($core.double value) => $_setDouble(11, value);
  @$pb.TagNumber(12)
  $core.bool hasOpen() => $_has(11);
  @$pb.TagNumber(12)
  void clearOpen() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.double get prevClose => $_getN(12);
  @$pb.TagNumber(13)
  set prevClose($core.double value) => $_setDouble(12, value);
  @$pb.TagNumber(13)
  $core.bool hasPrevClose() => $_has(12);
  @$pb.TagNumber(13)
  void clearPrevClose() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.double get volumeRatio => $_getN(13);
  @$pb.TagNumber(14)
  set volumeRatio($core.double value) => $_setDouble(13, value);
  @$pb.TagNumber(14)
  $core.bool hasVolumeRatio() => $_has(13);
  @$pb.TagNumber(14)
  void clearVolumeRatio() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.double get turnoverRate => $_getN(14);
  @$pb.TagNumber(15)
  set turnoverRate($core.double value) => $_setDouble(14, value);
  @$pb.TagNumber(15)
  $core.bool hasTurnoverRate() => $_has(14);
  @$pb.TagNumber(15)
  void clearTurnoverRate() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.double get peDynamic => $_getN(15);
  @$pb.TagNumber(16)
  set peDynamic($core.double value) => $_setDouble(15, value);
  @$pb.TagNumber(16)
  $core.bool hasPeDynamic() => $_has(15);
  @$pb.TagNumber(16)
  void clearPeDynamic() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.double get pbRatio => $_getN(16);
  @$pb.TagNumber(17)
  set pbRatio($core.double value) => $_setDouble(16, value);
  @$pb.TagNumber(17)
  $core.bool hasPbRatio() => $_has(16);
  @$pb.TagNumber(17)
  void clearPbRatio() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.double get totalMarketCap => $_getN(17);
  @$pb.TagNumber(18)
  set totalMarketCap($core.double value) => $_setDouble(17, value);
  @$pb.TagNumber(18)
  $core.bool hasTotalMarketCap() => $_has(17);
  @$pb.TagNumber(18)
  void clearTotalMarketCap() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.double get circulatingMarketCap => $_getN(18);
  @$pb.TagNumber(19)
  set circulatingMarketCap($core.double value) => $_setDouble(18, value);
  @$pb.TagNumber(19)
  $core.bool hasCirculatingMarketCap() => $_has(18);
  @$pb.TagNumber(19)
  void clearCirculatingMarketCap() => $_clearField(19);

  @$pb.TagNumber(20)
  $core.double get priceSpeed => $_getN(19);
  @$pb.TagNumber(20)
  set priceSpeed($core.double value) => $_setDouble(19, value);
  @$pb.TagNumber(20)
  $core.bool hasPriceSpeed() => $_has(19);
  @$pb.TagNumber(20)
  void clearPriceSpeed() => $_clearField(20);

  @$pb.TagNumber(21)
  $core.double get fiveMinChange => $_getN(20);
  @$pb.TagNumber(21)
  set fiveMinChange($core.double value) => $_setDouble(20, value);
  @$pb.TagNumber(21)
  $core.bool hasFiveMinChange() => $_has(20);
  @$pb.TagNumber(21)
  void clearFiveMinChange() => $_clearField(21);

  @$pb.TagNumber(22)
  $core.double get sixtyDayChangePct => $_getN(21);
  @$pb.TagNumber(22)
  set sixtyDayChangePct($core.double value) => $_setDouble(21, value);
  @$pb.TagNumber(22)
  $core.bool hasSixtyDayChangePct() => $_has(21);
  @$pb.TagNumber(22)
  void clearSixtyDayChangePct() => $_clearField(22);

  @$pb.TagNumber(23)
  $core.double get ytdChangePct => $_getN(22);
  @$pb.TagNumber(23)
  set ytdChangePct($core.double value) => $_setDouble(22, value);
  @$pb.TagNumber(23)
  $core.bool hasYtdChangePct() => $_has(22);
  @$pb.TagNumber(23)
  void clearYtdChangePct() => $_clearField(23);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
