// This is a generated file - do not edit.
//
// Generated from market_msg.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

///
/// 获取实时行情请求
class MarketRealtimeInfoReq extends $pb.GeneratedMessage {
  factory MarketRealtimeInfoReq() => create();

  MarketRealtimeInfoReq._();

  factory MarketRealtimeInfoReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MarketRealtimeInfoReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MarketRealtimeInfoReq',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarketRealtimeInfoReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarketRealtimeInfoReq copyWith(
          void Function(MarketRealtimeInfoReq) updates) =>
      super.copyWith((message) => updates(message as MarketRealtimeInfoReq))
          as MarketRealtimeInfoReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarketRealtimeInfoReq create() => MarketRealtimeInfoReq._();
  @$core.override
  MarketRealtimeInfoReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MarketRealtimeInfoReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MarketRealtimeInfoReq>(create);
  static MarketRealtimeInfoReq? _defaultInstance;
}

///
/// 获取实时行情响应
class MarketRealtimeInfoResp extends $pb.GeneratedMessage {
  factory MarketRealtimeInfoResp() => create();

  MarketRealtimeInfoResp._();

  factory MarketRealtimeInfoResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MarketRealtimeInfoResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MarketRealtimeInfoResp',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarketRealtimeInfoResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarketRealtimeInfoResp copyWith(
          void Function(MarketRealtimeInfoResp) updates) =>
      super.copyWith((message) => updates(message as MarketRealtimeInfoResp))
          as MarketRealtimeInfoResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarketRealtimeInfoResp create() => MarketRealtimeInfoResp._();
  @$core.override
  MarketRealtimeInfoResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MarketRealtimeInfoResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MarketRealtimeInfoResp>(create);
  static MarketRealtimeInfoResp? _defaultInstance;
}

const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
