// This is a generated file - do not edit.
//
// Generated from stock/stock_msg.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'stock_db.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// 获取对应股票的实时数据
class StockGetRealTimeDataReq extends $pb.GeneratedMessage {
  factory StockGetRealTimeDataReq({
    $core.Iterable<$core.String>? codes,
  }) {
    final result = create();
    if (codes != null) result.codes.addAll(codes);
    return result;
  }

  StockGetRealTimeDataReq._();

  factory StockGetRealTimeDataReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StockGetRealTimeDataReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StockGetRealTimeDataReq',
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'codes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetRealTimeDataReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetRealTimeDataReq copyWith(
          void Function(StockGetRealTimeDataReq) updates) =>
      super.copyWith((message) => updates(message as StockGetRealTimeDataReq))
          as StockGetRealTimeDataReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StockGetRealTimeDataReq create() => StockGetRealTimeDataReq._();
  @$core.override
  StockGetRealTimeDataReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StockGetRealTimeDataReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StockGetRealTimeDataReq>(create);
  static StockGetRealTimeDataReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get codes => $_getList(0);
}

class StockGetRealTimeDataResp extends $pb.GeneratedMessage {
  factory StockGetRealTimeDataResp({
    $core.Iterable<$0.DBStockRealTimeItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  StockGetRealTimeDataResp._();

  factory StockGetRealTimeDataResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StockGetRealTimeDataResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StockGetRealTimeDataResp',
      createEmptyInstance: create)
    ..pPM<$0.DBStockRealTimeItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: $0.DBStockRealTimeItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetRealTimeDataResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetRealTimeDataResp copyWith(
          void Function(StockGetRealTimeDataResp) updates) =>
      super.copyWith((message) => updates(message as StockGetRealTimeDataResp))
          as StockGetRealTimeDataResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StockGetRealTimeDataResp create() => StockGetRealTimeDataResp._();
  @$core.override
  StockGetRealTimeDataResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StockGetRealTimeDataResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StockGetRealTimeDataResp>(create);
  static StockGetRealTimeDataResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.DBStockRealTimeItem> get items => $_getList(0);
}

/// 获取股票当日分时数据
class StockGetIntradayChartReq extends $pb.GeneratedMessage {
  factory StockGetIntradayChartReq({
    $core.String? code,
  }) {
    final result = create();
    if (code != null) result.code = code;
    return result;
  }

  StockGetIntradayChartReq._();

  factory StockGetIntradayChartReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StockGetIntradayChartReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StockGetIntradayChartReq',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetIntradayChartReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetIntradayChartReq copyWith(
          void Function(StockGetIntradayChartReq) updates) =>
      super.copyWith((message) => updates(message as StockGetIntradayChartReq))
          as StockGetIntradayChartReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StockGetIntradayChartReq create() => StockGetIntradayChartReq._();
  @$core.override
  StockGetIntradayChartReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StockGetIntradayChartReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StockGetIntradayChartReq>(create);
  static StockGetIntradayChartReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);
}

/// 获取股票当日分时数据响应
class StockGetIntradayChartResp extends $pb.GeneratedMessage {
  factory StockGetIntradayChartResp({
    $core.Iterable<$0.DBStockRealTimeItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  StockGetIntradayChartResp._();

  factory StockGetIntradayChartResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StockGetIntradayChartResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StockGetIntradayChartResp',
      createEmptyInstance: create)
    ..pPM<$0.DBStockRealTimeItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: $0.DBStockRealTimeItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetIntradayChartResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetIntradayChartResp copyWith(
          void Function(StockGetIntradayChartResp) updates) =>
      super.copyWith((message) => updates(message as StockGetIntradayChartResp))
          as StockGetIntradayChartResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StockGetIntradayChartResp create() => StockGetIntradayChartResp._();
  @$core.override
  StockGetIntradayChartResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StockGetIntradayChartResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StockGetIntradayChartResp>(create);
  static StockGetIntradayChartResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.DBStockRealTimeItem> get items => $_getList(0);
}

/// 获取股票K线数据 period: `daily`/`weekly`/`monthly`
class StockGetHitDataReq extends $pb.GeneratedMessage {
  factory StockGetHitDataReq({
    $core.String? code,
    $core.String? period,
  }) {
    final result = create();
    if (code != null) result.code = code;
    if (period != null) result.period = period;
    return result;
  }

  StockGetHitDataReq._();

  factory StockGetHitDataReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StockGetHitDataReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StockGetHitDataReq',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..aOS(2, _omitFieldNames ? '' : 'period')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetHitDataReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetHitDataReq copyWith(void Function(StockGetHitDataReq) updates) =>
      super.copyWith((message) => updates(message as StockGetHitDataReq))
          as StockGetHitDataReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StockGetHitDataReq create() => StockGetHitDataReq._();
  @$core.override
  StockGetHitDataReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StockGetHitDataReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StockGetHitDataReq>(create);
  static StockGetHitDataReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get period => $_getSZ(1);
  @$pb.TagNumber(2)
  set period($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPeriod() => $_has(1);
  @$pb.TagNumber(2)
  void clearPeriod() => $_clearField(2);
}

class StockGetHitDataResp extends $pb.GeneratedMessage {
  factory StockGetHitDataResp({
    $core.Iterable<$0.DBStockBar>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  StockGetHitDataResp._();

  factory StockGetHitDataResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StockGetHitDataResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StockGetHitDataResp',
      createEmptyInstance: create)
    ..pPM<$0.DBStockBar>(1, _omitFieldNames ? '' : 'items',
        subBuilder: $0.DBStockBar.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetHitDataResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetHitDataResp copyWith(void Function(StockGetHitDataResp) updates) =>
      super.copyWith((message) => updates(message as StockGetHitDataResp))
          as StockGetHitDataResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StockGetHitDataResp create() => StockGetHitDataResp._();
  @$core.override
  StockGetHitDataResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StockGetHitDataResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StockGetHitDataResp>(create);
  static StockGetHitDataResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.DBStockBar> get items => $_getList(0);
}

/// 获取股票信息请求
class StockGetBasicInfoReq extends $pb.GeneratedMessage {
  factory StockGetBasicInfoReq({
    $core.String? code,
  }) {
    final result = create();
    if (code != null) result.code = code;
    return result;
  }

  StockGetBasicInfoReq._();

  factory StockGetBasicInfoReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StockGetBasicInfoReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StockGetBasicInfoReq',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetBasicInfoReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetBasicInfoReq copyWith(void Function(StockGetBasicInfoReq) updates) =>
      super.copyWith((message) => updates(message as StockGetBasicInfoReq))
          as StockGetBasicInfoReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StockGetBasicInfoReq create() => StockGetBasicInfoReq._();
  @$core.override
  StockGetBasicInfoReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StockGetBasicInfoReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StockGetBasicInfoReq>(create);
  static StockGetBasicInfoReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);
}

class StockGetBasicInfoResp extends $pb.GeneratedMessage {
  factory StockGetBasicInfoResp({
    $0.DBStockBasicInfo? info,
  }) {
    final result = create();
    if (info != null) result.info = info;
    return result;
  }

  StockGetBasicInfoResp._();

  factory StockGetBasicInfoResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StockGetBasicInfoResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StockGetBasicInfoResp',
      createEmptyInstance: create)
    ..aOM<$0.DBStockBasicInfo>(1, _omitFieldNames ? '' : 'info',
        subBuilder: $0.DBStockBasicInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetBasicInfoResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetBasicInfoResp copyWith(
          void Function(StockGetBasicInfoResp) updates) =>
      super.copyWith((message) => updates(message as StockGetBasicInfoResp))
          as StockGetBasicInfoResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StockGetBasicInfoResp create() => StockGetBasicInfoResp._();
  @$core.override
  StockGetBasicInfoResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StockGetBasicInfoResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StockGetBasicInfoResp>(create);
  static StockGetBasicInfoResp? _defaultInstance;

  @$pb.TagNumber(1)
  $0.DBStockBasicInfo get info => $_getN(0);
  @$pb.TagNumber(1)
  set info($0.DBStockBasicInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.DBStockBasicInfo ensureInfo() => $_ensure(0);
}

/// 获取股票的经营快照
class StockGetOperatingSnapshotReq extends $pb.GeneratedMessage {
  factory StockGetOperatingSnapshotReq({
    $core.String? code,
  }) {
    final result = create();
    if (code != null) result.code = code;
    return result;
  }

  StockGetOperatingSnapshotReq._();

  factory StockGetOperatingSnapshotReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StockGetOperatingSnapshotReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StockGetOperatingSnapshotReq',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetOperatingSnapshotReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetOperatingSnapshotReq copyWith(
          void Function(StockGetOperatingSnapshotReq) updates) =>
      super.copyWith(
              (message) => updates(message as StockGetOperatingSnapshotReq))
          as StockGetOperatingSnapshotReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StockGetOperatingSnapshotReq create() =>
      StockGetOperatingSnapshotReq._();
  @$core.override
  StockGetOperatingSnapshotReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StockGetOperatingSnapshotReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StockGetOperatingSnapshotReq>(create);
  static StockGetOperatingSnapshotReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);
}

class StockGetOperatingSnapshotResp extends $pb.GeneratedMessage {
  factory StockGetOperatingSnapshotResp({
    $core.Iterable<$0.DBStockOperatingSnapshot>? snapshots,
  }) {
    final result = create();
    if (snapshots != null) result.snapshots.addAll(snapshots);
    return result;
  }

  StockGetOperatingSnapshotResp._();

  factory StockGetOperatingSnapshotResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StockGetOperatingSnapshotResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StockGetOperatingSnapshotResp',
      createEmptyInstance: create)
    ..pPM<$0.DBStockOperatingSnapshot>(1, _omitFieldNames ? '' : 'snapshots',
        subBuilder: $0.DBStockOperatingSnapshot.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetOperatingSnapshotResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetOperatingSnapshotResp copyWith(
          void Function(StockGetOperatingSnapshotResp) updates) =>
      super.copyWith(
              (message) => updates(message as StockGetOperatingSnapshotResp))
          as StockGetOperatingSnapshotResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StockGetOperatingSnapshotResp create() =>
      StockGetOperatingSnapshotResp._();
  @$core.override
  StockGetOperatingSnapshotResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StockGetOperatingSnapshotResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StockGetOperatingSnapshotResp>(create);
  static StockGetOperatingSnapshotResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.DBStockOperatingSnapshot> get snapshots => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
