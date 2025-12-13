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
class MarketGetSpotsReq extends $pb.GeneratedMessage {
  factory MarketGetSpotsReq() => create();

  MarketGetSpotsReq._();

  factory MarketGetSpotsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MarketGetSpotsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MarketGetSpotsReq',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarketGetSpotsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarketGetSpotsReq copyWith(void Function(MarketGetSpotsReq) updates) =>
      super.copyWith((message) => updates(message as MarketGetSpotsReq))
          as MarketGetSpotsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarketGetSpotsReq create() => MarketGetSpotsReq._();
  @$core.override
  MarketGetSpotsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MarketGetSpotsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MarketGetSpotsReq>(create);
  static MarketGetSpotsReq? _defaultInstance;
}

///
/// 获取实时行情响应
class MarketGetSpotsResp extends $pb.GeneratedMessage {
  factory MarketGetSpotsResp({
    $core.Iterable<$0.DBMarketSpotItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  MarketGetSpotsResp._();

  factory MarketGetSpotsResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MarketGetSpotsResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MarketGetSpotsResp',
      createEmptyInstance: create)
    ..pPM<$0.DBMarketSpotItem>(1, _omitFieldNames ? '' : 'Items',
        protoName: 'Items', subBuilder: $0.DBMarketSpotItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarketGetSpotsResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarketGetSpotsResp copyWith(void Function(MarketGetSpotsResp) updates) =>
      super.copyWith((message) => updates(message as MarketGetSpotsResp))
          as MarketGetSpotsResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarketGetSpotsResp create() => MarketGetSpotsResp._();
  @$core.override
  MarketGetSpotsResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MarketGetSpotsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MarketGetSpotsResp>(create);
  static MarketGetSpotsResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.DBMarketSpotItem> get items => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
