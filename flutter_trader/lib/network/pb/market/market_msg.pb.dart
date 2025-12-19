// This is a generated file - do not edit.
//
// Generated from market/market_msg.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'market_db.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

///
/// 获取实时行情请求
class MarketGetRealTimeIndexsReq extends $pb.GeneratedMessage {
  factory MarketGetRealTimeIndexsReq() => create();

  MarketGetRealTimeIndexsReq._();

  factory MarketGetRealTimeIndexsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MarketGetRealTimeIndexsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MarketGetRealTimeIndexsReq',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarketGetRealTimeIndexsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarketGetRealTimeIndexsReq copyWith(
          void Function(MarketGetRealTimeIndexsReq) updates) =>
      super.copyWith(
              (message) => updates(message as MarketGetRealTimeIndexsReq))
          as MarketGetRealTimeIndexsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarketGetRealTimeIndexsReq create() => MarketGetRealTimeIndexsReq._();
  @$core.override
  MarketGetRealTimeIndexsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MarketGetRealTimeIndexsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MarketGetRealTimeIndexsReq>(create);
  static MarketGetRealTimeIndexsReq? _defaultInstance;
}

///
/// 获取实时行情响应
class MarketGetRealTimeIndexsResp extends $pb.GeneratedMessage {
  factory MarketGetRealTimeIndexsResp({
    $core.Iterable<$0.DBMarketIndexRealTimeItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  MarketGetRealTimeIndexsResp._();

  factory MarketGetRealTimeIndexsResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MarketGetRealTimeIndexsResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MarketGetRealTimeIndexsResp',
      createEmptyInstance: create)
    ..pPM<$0.DBMarketIndexRealTimeItem>(1, _omitFieldNames ? '' : 'Items',
        protoName: 'Items', subBuilder: $0.DBMarketIndexRealTimeItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarketGetRealTimeIndexsResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarketGetRealTimeIndexsResp copyWith(
          void Function(MarketGetRealTimeIndexsResp) updates) =>
      super.copyWith(
              (message) => updates(message as MarketGetRealTimeIndexsResp))
          as MarketGetRealTimeIndexsResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarketGetRealTimeIndexsResp create() =>
      MarketGetRealTimeIndexsResp._();
  @$core.override
  MarketGetRealTimeIndexsResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MarketGetRealTimeIndexsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MarketGetRealTimeIndexsResp>(create);
  static MarketGetRealTimeIndexsResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.DBMarketIndexRealTimeItem> get items => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
