// This is a generated file - do not edit.
//
// Generated from collection/collection_msg.proto.

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

/// 初始化股票数据请求
/// 参数: code 股票代码
class RPC_CollectionInitStockReq extends $pb.GeneratedMessage {
  factory RPC_CollectionInitStockReq({
    $core.String? code,
  }) {
    final result = create();
    if (code != null) result.code = code;
    return result;
  }

  RPC_CollectionInitStockReq._();

  factory RPC_CollectionInitStockReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RPC_CollectionInitStockReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RPC_CollectionInitStockReq',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RPC_CollectionInitStockReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RPC_CollectionInitStockReq copyWith(
          void Function(RPC_CollectionInitStockReq) updates) =>
      super.copyWith(
              (message) => updates(message as RPC_CollectionInitStockReq))
          as RPC_CollectionInitStockReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RPC_CollectionInitStockReq create() => RPC_CollectionInitStockReq._();
  @$core.override
  RPC_CollectionInitStockReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RPC_CollectionInitStockReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RPC_CollectionInitStockReq>(create);
  static RPC_CollectionInitStockReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);
}

/// 初始化股票数据响应
/// 参数: code 股票代码
class RPC_CollectionInitStockResp extends $pb.GeneratedMessage {
  factory RPC_CollectionInitStockResp({
    $fixnum.Int64? code,
  }) {
    final result = create();
    if (code != null) result.code = code;
    return result;
  }

  RPC_CollectionInitStockResp._();

  factory RPC_CollectionInitStockResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RPC_CollectionInitStockResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RPC_CollectionInitStockResp',
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'code')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RPC_CollectionInitStockResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RPC_CollectionInitStockResp copyWith(
          void Function(RPC_CollectionInitStockResp) updates) =>
      super.copyWith(
              (message) => updates(message as RPC_CollectionInitStockResp))
          as RPC_CollectionInitStockResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RPC_CollectionInitStockResp create() =>
      RPC_CollectionInitStockResp._();
  @$core.override
  RPC_CollectionInitStockResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RPC_CollectionInitStockResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RPC_CollectionInitStockResp>(create);
  static RPC_CollectionInitStockResp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get code => $_getI64(0);
  @$pb.TagNumber(1)
  set code($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
