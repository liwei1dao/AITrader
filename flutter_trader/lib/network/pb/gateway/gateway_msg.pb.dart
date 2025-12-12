// This is a generated file - do not edit.
//
// Generated from gateway/gateway_msg.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/any.pb.dart' as $0;

import '../comm.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// 网关心跳 请求
class GatewayHeartbeatReq extends $pb.GeneratedMessage {
  factory GatewayHeartbeatReq() => create();

  GatewayHeartbeatReq._();

  factory GatewayHeartbeatReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GatewayHeartbeatReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GatewayHeartbeatReq',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GatewayHeartbeatReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GatewayHeartbeatReq copyWith(void Function(GatewayHeartbeatReq) updates) =>
      super.copyWith((message) => updates(message as GatewayHeartbeatReq))
          as GatewayHeartbeatReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GatewayHeartbeatReq create() => GatewayHeartbeatReq._();
  @$core.override
  GatewayHeartbeatReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GatewayHeartbeatReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GatewayHeartbeatReq>(create);
  static GatewayHeartbeatReq? _defaultInstance;
}

/// 网关心跳 请求回应
class GatewayHeartbeatResp extends $pb.GeneratedMessage {
  factory GatewayHeartbeatResp({
    $fixnum.Int64? timestamp,
  }) {
    final result = create();
    if (timestamp != null) result.timestamp = timestamp;
    return result;
  }

  GatewayHeartbeatResp._();

  factory GatewayHeartbeatResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GatewayHeartbeatResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GatewayHeartbeatResp',
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'timestamp')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GatewayHeartbeatResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GatewayHeartbeatResp copyWith(void Function(GatewayHeartbeatResp) updates) =>
      super.copyWith((message) => updates(message as GatewayHeartbeatResp))
          as GatewayHeartbeatResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GatewayHeartbeatResp create() => GatewayHeartbeatResp._();
  @$core.override
  GatewayHeartbeatResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GatewayHeartbeatResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GatewayHeartbeatResp>(create);
  static GatewayHeartbeatResp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get timestamp => $_getI64(0);
  @$pb.TagNumber(1)
  set timestamp($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestamp() => $_clearField(1);
}

/// 统一错误码推送
class GatewayErrorNotifyPush extends $pb.GeneratedMessage {
  factory GatewayErrorNotifyPush({
    $core.String? msgName,
    $core.String? servicePath,
    $0.Any? req,
    $1.ErrorData? error,
  }) {
    final result = create();
    if (msgName != null) result.msgName = msgName;
    if (servicePath != null) result.servicePath = servicePath;
    if (req != null) result.req = req;
    if (error != null) result.error = error;
    return result;
  }

  GatewayErrorNotifyPush._();

  factory GatewayErrorNotifyPush.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GatewayErrorNotifyPush.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GatewayErrorNotifyPush',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'MsgName', protoName: 'MsgName')
    ..aOS(2, _omitFieldNames ? '' : 'ServicePath', protoName: 'ServicePath')
    ..aOM<$0.Any>(3, _omitFieldNames ? '' : 'Req',
        protoName: 'Req', subBuilder: $0.Any.create)
    ..aOM<$1.ErrorData>(4, _omitFieldNames ? '' : 'Error',
        protoName: 'Error', subBuilder: $1.ErrorData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GatewayErrorNotifyPush clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GatewayErrorNotifyPush copyWith(
          void Function(GatewayErrorNotifyPush) updates) =>
      super.copyWith((message) => updates(message as GatewayErrorNotifyPush))
          as GatewayErrorNotifyPush;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GatewayErrorNotifyPush create() => GatewayErrorNotifyPush._();
  @$core.override
  GatewayErrorNotifyPush createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GatewayErrorNotifyPush getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GatewayErrorNotifyPush>(create);
  static GatewayErrorNotifyPush? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get msgName => $_getSZ(0);
  @$pb.TagNumber(1)
  set msgName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMsgName() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsgName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get servicePath => $_getSZ(1);
  @$pb.TagNumber(2)
  set servicePath($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasServicePath() => $_has(1);
  @$pb.TagNumber(2)
  void clearServicePath() => $_clearField(2);

  @$pb.TagNumber(3)
  $0.Any get req => $_getN(2);
  @$pb.TagNumber(3)
  set req($0.Any value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasReq() => $_has(2);
  @$pb.TagNumber(3)
  void clearReq() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Any ensureReq() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.ErrorData get error => $_getN(3);
  @$pb.TagNumber(4)
  set error($1.ErrorData value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasError() => $_has(3);
  @$pb.TagNumber(4)
  void clearError() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.ErrorData ensureError() => $_ensure(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
