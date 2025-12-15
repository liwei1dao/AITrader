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

/// 获取股票信息请求
class StockGetInfosReq extends $pb.GeneratedMessage {
  factory StockGetInfosReq({
    $core.Iterable<$core.String>? stockIds,
  }) {
    final result = create();
    if (stockIds != null) result.stockIds.addAll(stockIds);
    return result;
  }

  StockGetInfosReq._();

  factory StockGetInfosReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StockGetInfosReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StockGetInfosReq',
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'stockIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetInfosReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetInfosReq copyWith(void Function(StockGetInfosReq) updates) =>
      super.copyWith((message) => updates(message as StockGetInfosReq))
          as StockGetInfosReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StockGetInfosReq create() => StockGetInfosReq._();
  @$core.override
  StockGetInfosReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StockGetInfosReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StockGetInfosReq>(create);
  static StockGetInfosReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get stockIds => $_getList(0);
}

class StockGetInfosResp extends $pb.GeneratedMessage {
  factory StockGetInfosResp({
    $core.Iterable<$0.DBStockIdentity>? stockInfos,
  }) {
    final result = create();
    if (stockInfos != null) result.stockInfos.addAll(stockInfos);
    return result;
  }

  StockGetInfosResp._();

  factory StockGetInfosResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StockGetInfosResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StockGetInfosResp',
      createEmptyInstance: create)
    ..pPM<$0.DBStockIdentity>(1, _omitFieldNames ? '' : 'stockInfos',
        subBuilder: $0.DBStockIdentity.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetInfosResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetInfosResp copyWith(void Function(StockGetInfosResp) updates) =>
      super.copyWith((message) => updates(message as StockGetInfosResp))
          as StockGetInfosResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StockGetInfosResp create() => StockGetInfosResp._();
  @$core.override
  StockGetInfosResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StockGetInfosResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StockGetInfosResp>(create);
  static StockGetInfosResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.DBStockIdentity> get stockInfos => $_getList(0);
}

/// 获取基本面快照请求
class StockGetFundamentalSnapshotReq extends $pb.GeneratedMessage {
  factory StockGetFundamentalSnapshotReq({
    $core.String? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  StockGetFundamentalSnapshotReq._();

  factory StockGetFundamentalSnapshotReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StockGetFundamentalSnapshotReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StockGetFundamentalSnapshotReq',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetFundamentalSnapshotReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetFundamentalSnapshotReq copyWith(
          void Function(StockGetFundamentalSnapshotReq) updates) =>
      super.copyWith(
              (message) => updates(message as StockGetFundamentalSnapshotReq))
          as StockGetFundamentalSnapshotReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StockGetFundamentalSnapshotReq create() =>
      StockGetFundamentalSnapshotReq._();
  @$core.override
  StockGetFundamentalSnapshotReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StockGetFundamentalSnapshotReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StockGetFundamentalSnapshotReq>(create);
  static StockGetFundamentalSnapshotReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class StockGetFundamentalSnapshotResp extends $pb.GeneratedMessage {
  factory StockGetFundamentalSnapshotResp({
    $core.Iterable<$0.DBFundamentalSnapshot>? snapshots,
  }) {
    final result = create();
    if (snapshots != null) result.snapshots.addAll(snapshots);
    return result;
  }

  StockGetFundamentalSnapshotResp._();

  factory StockGetFundamentalSnapshotResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StockGetFundamentalSnapshotResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StockGetFundamentalSnapshotResp',
      createEmptyInstance: create)
    ..pPM<$0.DBFundamentalSnapshot>(1, _omitFieldNames ? '' : 'snapshots',
        subBuilder: $0.DBFundamentalSnapshot.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetFundamentalSnapshotResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockGetFundamentalSnapshotResp copyWith(
          void Function(StockGetFundamentalSnapshotResp) updates) =>
      super.copyWith(
              (message) => updates(message as StockGetFundamentalSnapshotResp))
          as StockGetFundamentalSnapshotResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StockGetFundamentalSnapshotResp create() =>
      StockGetFundamentalSnapshotResp._();
  @$core.override
  StockGetFundamentalSnapshotResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StockGetFundamentalSnapshotResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StockGetFundamentalSnapshotResp>(
          create);
  static StockGetFundamentalSnapshotResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.DBFundamentalSnapshot> get snapshots => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
