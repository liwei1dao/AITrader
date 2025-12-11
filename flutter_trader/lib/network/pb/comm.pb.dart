// This is a generated file - do not edit.
//
// Generated from comm.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/any.pb.dart' as $0;

import 'errorcode.pbenum.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class ErrorData extends $pb.GeneratedMessage {
  factory ErrorData({
    $1.ErrorCode? code,
    $core.String? message,
  }) {
    final result = create();
    if (code != null) result.code = code;
    if (message != null) result.message = message;
    return result;
  }

  ErrorData._();

  factory ErrorData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ErrorData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ErrorData',
      createEmptyInstance: create)
    ..aE<$1.ErrorCode>(1, _omitFieldNames ? '' : 'Code',
        protoName: 'Code', enumValues: $1.ErrorCode.values)
    ..aOS(2, _omitFieldNames ? '' : 'Message', protoName: 'Message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ErrorData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ErrorData copyWith(void Function(ErrorData) updates) =>
      super.copyWith((message) => updates(message as ErrorData)) as ErrorData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ErrorData create() => ErrorData._();
  @$core.override
  ErrorData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ErrorData getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ErrorData>(create);
  static ErrorData? _defaultInstance;

  @$pb.TagNumber(1)
  $1.ErrorCode get code => $_getN(0);
  @$pb.TagNumber(1)
  set code($1.ErrorCode value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

/// 网关Http路由请求
class Rpc_GatewayHttpRouteReq extends $pb.GeneratedMessage {
  factory Rpc_GatewayHttpRouteReq({
    $core.String? msgName,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? meta,
    $core.List<$core.int>? message,
  }) {
    final result = create();
    if (msgName != null) result.msgName = msgName;
    if (meta != null) result.meta.addEntries(meta);
    if (message != null) result.message = message;
    return result;
  }

  Rpc_GatewayHttpRouteReq._();

  factory Rpc_GatewayHttpRouteReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Rpc_GatewayHttpRouteReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Rpc_GatewayHttpRouteReq',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'MsgName', protoName: 'MsgName')
    ..m<$core.String, $core.String>(2, _omitFieldNames ? '' : 'Meta',
        protoName: 'Meta',
        entryClassName: 'Rpc_GatewayHttpRouteReq.MetaEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'Message', $pb.PbFieldType.OY,
        protoName: 'Message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Rpc_GatewayHttpRouteReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Rpc_GatewayHttpRouteReq copyWith(
          void Function(Rpc_GatewayHttpRouteReq) updates) =>
      super.copyWith((message) => updates(message as Rpc_GatewayHttpRouteReq))
          as Rpc_GatewayHttpRouteReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Rpc_GatewayHttpRouteReq create() => Rpc_GatewayHttpRouteReq._();
  @$core.override
  Rpc_GatewayHttpRouteReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Rpc_GatewayHttpRouteReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Rpc_GatewayHttpRouteReq>(create);
  static Rpc_GatewayHttpRouteReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get msgName => $_getSZ(0);
  @$pb.TagNumber(1)
  set msgName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMsgName() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsgName() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, $core.String> get meta => $_getMap(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get message => $_getN(2);
  @$pb.TagNumber(3)
  set message($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => $_clearField(3);
}

class Rpc_GatewayHttpRouteResp extends $pb.GeneratedMessage {
  factory Rpc_GatewayHttpRouteResp({
    $core.String? contentType,
    $core.List<$core.int>? body,
  }) {
    final result = create();
    if (contentType != null) result.contentType = contentType;
    if (body != null) result.body = body;
    return result;
  }

  Rpc_GatewayHttpRouteResp._();

  factory Rpc_GatewayHttpRouteResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Rpc_GatewayHttpRouteResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Rpc_GatewayHttpRouteResp',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ContentType', protoName: 'ContentType')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'Body', $pb.PbFieldType.OY,
        protoName: 'Body')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Rpc_GatewayHttpRouteResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Rpc_GatewayHttpRouteResp copyWith(
          void Function(Rpc_GatewayHttpRouteResp) updates) =>
      super.copyWith((message) => updates(message as Rpc_GatewayHttpRouteResp))
          as Rpc_GatewayHttpRouteResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Rpc_GatewayHttpRouteResp create() => Rpc_GatewayHttpRouteResp._();
  @$core.override
  Rpc_GatewayHttpRouteResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Rpc_GatewayHttpRouteResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Rpc_GatewayHttpRouteResp>(create);
  static Rpc_GatewayHttpRouteResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get contentType => $_getSZ(0);
  @$pb.TagNumber(1)
  set contentType($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasContentType() => $_has(0);
  @$pb.TagNumber(1)
  void clearContentType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get body => $_getN(1);
  @$pb.TagNumber(2)
  set body($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBody() => $_has(1);
  @$pb.TagNumber(2)
  void clearBody() => $_clearField(2);
}

/// 集合包
class MessagePackage extends $pb.GeneratedMessage {
  factory MessagePackage({
    $core.Iterable<SocketMessage>? messages,
  }) {
    final result = create();
    if (messages != null) result.messages.addAll(messages);
    return result;
  }

  MessagePackage._();

  factory MessagePackage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MessagePackage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MessagePackage',
      createEmptyInstance: create)
    ..pPM<SocketMessage>(1, _omitFieldNames ? '' : 'messages',
        subBuilder: SocketMessage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessagePackage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessagePackage copyWith(void Function(MessagePackage) updates) =>
      super.copyWith((message) => updates(message as MessagePackage))
          as MessagePackage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessagePackage create() => MessagePackage._();
  @$core.override
  MessagePackage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MessagePackage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MessagePackage>(create);
  static MessagePackage? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SocketMessage> get messages => $_getList(0);
}

/// 用户消息流结构1
class SocketMessage extends $pb.GeneratedMessage {
  factory SocketMessage({
    $core.String? msgName,
    $core.String? servicePath,
    $0.Any? data,
    $core.String? sec,
  }) {
    final result = create();
    if (msgName != null) result.msgName = msgName;
    if (servicePath != null) result.servicePath = servicePath;
    if (data != null) result.data = data;
    if (sec != null) result.sec = sec;
    return result;
  }

  SocketMessage._();

  factory SocketMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SocketMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SocketMessage',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'MsgName', protoName: 'MsgName')
    ..aOS(2, _omitFieldNames ? '' : 'servicePath', protoName: 'servicePath')
    ..aOM<$0.Any>(3, _omitFieldNames ? '' : 'data', subBuilder: $0.Any.create)
    ..aOS(4, _omitFieldNames ? '' : 'sec')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SocketMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SocketMessage copyWith(void Function(SocketMessage) updates) =>
      super.copyWith((message) => updates(message as SocketMessage))
          as SocketMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SocketMessage create() => SocketMessage._();
  @$core.override
  SocketMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SocketMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SocketMessage>(create);
  static SocketMessage? _defaultInstance;

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
  $0.Any get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($0.Any value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Any ensureData() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get sec => $_getSZ(3);
  @$pb.TagNumber(4)
  set sec($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSec() => $_has(3);
  @$pb.TagNumber(4)
  void clearSec() => $_clearField(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
