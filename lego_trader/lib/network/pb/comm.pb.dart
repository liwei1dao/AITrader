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
    ..aOS(2, _omitFieldNames ? '' : 'ServicePath', protoName: 'ServicePath')
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

/// 网关Http 路由请求
class Rpc_GatewayHttpRouteReq extends $pb.GeneratedMessage {
  factory Rpc_GatewayHttpRouteReq({
    $core.String? msgName,
    $core.String? meta,
    $core.List<$core.int>? message,
  }) {
    final result = create();
    if (msgName != null) result.msgName = msgName;
    if (meta != null) result.meta = meta;
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
    ..aOS(2, _omitFieldNames ? '' : 'Meta', protoName: 'Meta')
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
  $core.String get meta => $_getSZ(1);
  @$pb.TagNumber(2)
  set meta($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMeta() => $_has(1);
  @$pb.TagNumber(2)
  void clearMeta() => $_clearField(2);

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

class Rpc_GatewayRouteReq extends $pb.GeneratedMessage {
  factory Rpc_GatewayRouteReq({
    $core.String? msgName,
    $core.String? meta,
    $0.Any? message,
  }) {
    final result = create();
    if (msgName != null) result.msgName = msgName;
    if (meta != null) result.meta = meta;
    if (message != null) result.message = message;
    return result;
  }

  Rpc_GatewayRouteReq._();

  factory Rpc_GatewayRouteReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Rpc_GatewayRouteReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Rpc_GatewayRouteReq',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'MsgName', protoName: 'MsgName')
    ..aOS(2, _omitFieldNames ? '' : 'Meta', protoName: 'Meta')
    ..aOM<$0.Any>(3, _omitFieldNames ? '' : 'Message',
        protoName: 'Message', subBuilder: $0.Any.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Rpc_GatewayRouteReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Rpc_GatewayRouteReq copyWith(void Function(Rpc_GatewayRouteReq) updates) =>
      super.copyWith((message) => updates(message as Rpc_GatewayRouteReq))
          as Rpc_GatewayRouteReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Rpc_GatewayRouteReq create() => Rpc_GatewayRouteReq._();
  @$core.override
  Rpc_GatewayRouteReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Rpc_GatewayRouteReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Rpc_GatewayRouteReq>(create);
  static Rpc_GatewayRouteReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get msgName => $_getSZ(0);
  @$pb.TagNumber(1)
  set msgName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMsgName() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsgName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get meta => $_getSZ(1);
  @$pb.TagNumber(2)
  set meta($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMeta() => $_has(1);
  @$pb.TagNumber(2)
  void clearMeta() => $_clearField(2);

  @$pb.TagNumber(3)
  $0.Any get message => $_getN(2);
  @$pb.TagNumber(3)
  set message($0.Any value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Any ensureMessage() => $_ensure(2);
}

class Rpc_GatewayRouteResp extends $pb.GeneratedMessage {
  factory Rpc_GatewayRouteResp({
    $core.String? servicePath,
    $core.String? changeMeta,
    $core.Iterable<SocketMessage>? reply,
    ErrorData? errorData,
  }) {
    final result = create();
    if (servicePath != null) result.servicePath = servicePath;
    if (changeMeta != null) result.changeMeta = changeMeta;
    if (reply != null) result.reply.addAll(reply);
    if (errorData != null) result.errorData = errorData;
    return result;
  }

  Rpc_GatewayRouteResp._();

  factory Rpc_GatewayRouteResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Rpc_GatewayRouteResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Rpc_GatewayRouteResp',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ServicePath', protoName: 'ServicePath')
    ..aOS(2, _omitFieldNames ? '' : 'ChangeMeta', protoName: 'ChangeMeta')
    ..pPM<SocketMessage>(3, _omitFieldNames ? '' : 'Reply',
        protoName: 'Reply', subBuilder: SocketMessage.create)
    ..aOM<ErrorData>(4, _omitFieldNames ? '' : 'ErrorData',
        protoName: 'ErrorData', subBuilder: ErrorData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Rpc_GatewayRouteResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Rpc_GatewayRouteResp copyWith(void Function(Rpc_GatewayRouteResp) updates) =>
      super.copyWith((message) => updates(message as Rpc_GatewayRouteResp))
          as Rpc_GatewayRouteResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Rpc_GatewayRouteResp create() => Rpc_GatewayRouteResp._();
  @$core.override
  Rpc_GatewayRouteResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Rpc_GatewayRouteResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Rpc_GatewayRouteResp>(create);
  static Rpc_GatewayRouteResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get servicePath => $_getSZ(0);
  @$pb.TagNumber(1)
  set servicePath($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasServicePath() => $_has(0);
  @$pb.TagNumber(1)
  void clearServicePath() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get changeMeta => $_getSZ(1);
  @$pb.TagNumber(2)
  set changeMeta($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChangeMeta() => $_has(1);
  @$pb.TagNumber(2)
  void clearChangeMeta() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<SocketMessage> get reply => $_getList(2);

  @$pb.TagNumber(4)
  ErrorData get errorData => $_getN(3);
  @$pb.TagNumber(4)
  set errorData(ErrorData value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasErrorData() => $_has(3);
  @$pb.TagNumber(4)
  void clearErrorData() => $_clearField(4);
  @$pb.TagNumber(4)
  ErrorData ensureErrorData() => $_ensure(3);
}

/// RPC向用户代理发送消息
class Rpc_GatewaySendMsgToAgentReq extends $pb.GeneratedMessage {
  factory Rpc_GatewaySendMsgToAgentReq({
    $core.String? userSessionId,
    $core.Iterable<SocketMessage>? reply,
  }) {
    final result = create();
    if (userSessionId != null) result.userSessionId = userSessionId;
    if (reply != null) result.reply.addAll(reply);
    return result;
  }

  Rpc_GatewaySendMsgToAgentReq._();

  factory Rpc_GatewaySendMsgToAgentReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Rpc_GatewaySendMsgToAgentReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Rpc_GatewaySendMsgToAgentReq',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'UserSessionId', protoName: 'UserSessionId')
    ..pPM<SocketMessage>(2, _omitFieldNames ? '' : 'Reply',
        protoName: 'Reply', subBuilder: SocketMessage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Rpc_GatewaySendMsgToAgentReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Rpc_GatewaySendMsgToAgentReq copyWith(
          void Function(Rpc_GatewaySendMsgToAgentReq) updates) =>
      super.copyWith(
              (message) => updates(message as Rpc_GatewaySendMsgToAgentReq))
          as Rpc_GatewaySendMsgToAgentReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Rpc_GatewaySendMsgToAgentReq create() =>
      Rpc_GatewaySendMsgToAgentReq._();
  @$core.override
  Rpc_GatewaySendMsgToAgentReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Rpc_GatewaySendMsgToAgentReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Rpc_GatewaySendMsgToAgentReq>(create);
  static Rpc_GatewaySendMsgToAgentReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userSessionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userSessionId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserSessionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<SocketMessage> get reply => $_getList(1);
}

class Rpc_GatewaySendMsgToAgentResp extends $pb.GeneratedMessage {
  factory Rpc_GatewaySendMsgToAgentResp({
    ErrorData? errorData,
  }) {
    final result = create();
    if (errorData != null) result.errorData = errorData;
    return result;
  }

  Rpc_GatewaySendMsgToAgentResp._();

  factory Rpc_GatewaySendMsgToAgentResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Rpc_GatewaySendMsgToAgentResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Rpc_GatewaySendMsgToAgentResp',
      createEmptyInstance: create)
    ..aOM<ErrorData>(1, _omitFieldNames ? '' : 'ErrorData',
        protoName: 'ErrorData', subBuilder: ErrorData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Rpc_GatewaySendMsgToAgentResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Rpc_GatewaySendMsgToAgentResp copyWith(
          void Function(Rpc_GatewaySendMsgToAgentResp) updates) =>
      super.copyWith(
              (message) => updates(message as Rpc_GatewaySendMsgToAgentResp))
          as Rpc_GatewaySendMsgToAgentResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Rpc_GatewaySendMsgToAgentResp create() =>
      Rpc_GatewaySendMsgToAgentResp._();
  @$core.override
  Rpc_GatewaySendMsgToAgentResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Rpc_GatewaySendMsgToAgentResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Rpc_GatewaySendMsgToAgentResp>(create);
  static Rpc_GatewaySendMsgToAgentResp? _defaultInstance;

  @$pb.TagNumber(1)
  ErrorData get errorData => $_getN(0);
  @$pb.TagNumber(1)
  set errorData(ErrorData value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasErrorData() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrorData() => $_clearField(1);
  @$pb.TagNumber(1)
  ErrorData ensureErrorData() => $_ensure(0);
}

class Rpc_GatewaySendMsgsToAgentsReq extends $pb.GeneratedMessage {
  factory Rpc_GatewaySendMsgsToAgentsReq({
    $core.Iterable<$core.String>? userSessionIds,
    $core.Iterable<SocketMessage>? reply,
  }) {
    final result = create();
    if (userSessionIds != null) result.userSessionIds.addAll(userSessionIds);
    if (reply != null) result.reply.addAll(reply);
    return result;
  }

  Rpc_GatewaySendMsgsToAgentsReq._();

  factory Rpc_GatewaySendMsgsToAgentsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Rpc_GatewaySendMsgsToAgentsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Rpc_GatewaySendMsgsToAgentsReq',
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'UserSessionIds',
        protoName: 'UserSessionIds')
    ..pPM<SocketMessage>(2, _omitFieldNames ? '' : 'Reply',
        protoName: 'Reply', subBuilder: SocketMessage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Rpc_GatewaySendMsgsToAgentsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Rpc_GatewaySendMsgsToAgentsReq copyWith(
          void Function(Rpc_GatewaySendMsgsToAgentsReq) updates) =>
      super.copyWith(
              (message) => updates(message as Rpc_GatewaySendMsgsToAgentsReq))
          as Rpc_GatewaySendMsgsToAgentsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Rpc_GatewaySendMsgsToAgentsReq create() =>
      Rpc_GatewaySendMsgsToAgentsReq._();
  @$core.override
  Rpc_GatewaySendMsgsToAgentsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Rpc_GatewaySendMsgsToAgentsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Rpc_GatewaySendMsgsToAgentsReq>(create);
  static Rpc_GatewaySendMsgsToAgentsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get userSessionIds => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<SocketMessage> get reply => $_getList(1);
}

class Rpc_GatewaySendMsgsToAgentsResp extends $pb.GeneratedMessage {
  factory Rpc_GatewaySendMsgsToAgentsResp({
    ErrorData? errorData,
  }) {
    final result = create();
    if (errorData != null) result.errorData = errorData;
    return result;
  }

  Rpc_GatewaySendMsgsToAgentsResp._();

  factory Rpc_GatewaySendMsgsToAgentsResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Rpc_GatewaySendMsgsToAgentsResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Rpc_GatewaySendMsgsToAgentsResp',
      createEmptyInstance: create)
    ..aOM<ErrorData>(1, _omitFieldNames ? '' : 'ErrorData',
        protoName: 'ErrorData', subBuilder: ErrorData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Rpc_GatewaySendMsgsToAgentsResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Rpc_GatewaySendMsgsToAgentsResp copyWith(
          void Function(Rpc_GatewaySendMsgsToAgentsResp) updates) =>
      super.copyWith(
              (message) => updates(message as Rpc_GatewaySendMsgsToAgentsResp))
          as Rpc_GatewaySendMsgsToAgentsResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Rpc_GatewaySendMsgsToAgentsResp create() =>
      Rpc_GatewaySendMsgsToAgentsResp._();
  @$core.override
  Rpc_GatewaySendMsgsToAgentsResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Rpc_GatewaySendMsgsToAgentsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Rpc_GatewaySendMsgsToAgentsResp>(
          create);
  static Rpc_GatewaySendMsgsToAgentsResp? _defaultInstance;

  @$pb.TagNumber(1)
  ErrorData get errorData => $_getN(0);
  @$pb.TagNumber(1)
  set errorData(ErrorData value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasErrorData() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrorData() => $_clearField(1);
  @$pb.TagNumber(1)
  ErrorData ensureErrorData() => $_ensure(0);
}

class Rpc_GatewaySendMsgsToAllAgentsReq extends $pb.GeneratedMessage {
  factory Rpc_GatewaySendMsgsToAllAgentsReq({
    $core.Iterable<SocketMessage>? reply,
  }) {
    final result = create();
    if (reply != null) result.reply.addAll(reply);
    return result;
  }

  Rpc_GatewaySendMsgsToAllAgentsReq._();

  factory Rpc_GatewaySendMsgsToAllAgentsReq.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Rpc_GatewaySendMsgsToAllAgentsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Rpc_GatewaySendMsgsToAllAgentsReq',
      createEmptyInstance: create)
    ..pPM<SocketMessage>(2, _omitFieldNames ? '' : 'Reply',
        protoName: 'Reply', subBuilder: SocketMessage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Rpc_GatewaySendMsgsToAllAgentsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Rpc_GatewaySendMsgsToAllAgentsReq copyWith(
          void Function(Rpc_GatewaySendMsgsToAllAgentsReq) updates) =>
      super.copyWith((message) =>
              updates(message as Rpc_GatewaySendMsgsToAllAgentsReq))
          as Rpc_GatewaySendMsgsToAllAgentsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Rpc_GatewaySendMsgsToAllAgentsReq create() =>
      Rpc_GatewaySendMsgsToAllAgentsReq._();
  @$core.override
  Rpc_GatewaySendMsgsToAllAgentsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Rpc_GatewaySendMsgsToAllAgentsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Rpc_GatewaySendMsgsToAllAgentsReq>(
          create);
  static Rpc_GatewaySendMsgsToAllAgentsReq? _defaultInstance;

  @$pb.TagNumber(2)
  $pb.PbList<SocketMessage> get reply => $_getList(0);
}

class Rpc_GatewaySendMsgsToAllAgentsResp extends $pb.GeneratedMessage {
  factory Rpc_GatewaySendMsgsToAllAgentsResp({
    ErrorData? errorData,
  }) {
    final result = create();
    if (errorData != null) result.errorData = errorData;
    return result;
  }

  Rpc_GatewaySendMsgsToAllAgentsResp._();

  factory Rpc_GatewaySendMsgsToAllAgentsResp.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Rpc_GatewaySendMsgsToAllAgentsResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Rpc_GatewaySendMsgsToAllAgentsResp',
      createEmptyInstance: create)
    ..aOM<ErrorData>(1, _omitFieldNames ? '' : 'ErrorData',
        protoName: 'ErrorData', subBuilder: ErrorData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Rpc_GatewaySendMsgsToAllAgentsResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Rpc_GatewaySendMsgsToAllAgentsResp copyWith(
          void Function(Rpc_GatewaySendMsgsToAllAgentsResp) updates) =>
      super.copyWith((message) =>
              updates(message as Rpc_GatewaySendMsgsToAllAgentsResp))
          as Rpc_GatewaySendMsgsToAllAgentsResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Rpc_GatewaySendMsgsToAllAgentsResp create() =>
      Rpc_GatewaySendMsgsToAllAgentsResp._();
  @$core.override
  Rpc_GatewaySendMsgsToAllAgentsResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Rpc_GatewaySendMsgsToAllAgentsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Rpc_GatewaySendMsgsToAllAgentsResp>(
          create);
  static Rpc_GatewaySendMsgsToAllAgentsResp? _defaultInstance;

  @$pb.TagNumber(1)
  ErrorData get errorData => $_getN(0);
  @$pb.TagNumber(1)
  set errorData(ErrorData value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasErrorData() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrorData() => $_clearField(1);
  @$pb.TagNumber(1)
  ErrorData ensureErrorData() => $_ensure(0);
}

class Rpc_GatewayCloseAgentsReq extends $pb.GeneratedMessage {
  factory Rpc_GatewayCloseAgentsReq({
    $core.Iterable<$core.String>? userSessionIds,
  }) {
    final result = create();
    if (userSessionIds != null) result.userSessionIds.addAll(userSessionIds);
    return result;
  }

  Rpc_GatewayCloseAgentsReq._();

  factory Rpc_GatewayCloseAgentsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Rpc_GatewayCloseAgentsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Rpc_GatewayCloseAgentsReq',
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'UserSessionIds',
        protoName: 'UserSessionIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Rpc_GatewayCloseAgentsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Rpc_GatewayCloseAgentsReq copyWith(
          void Function(Rpc_GatewayCloseAgentsReq) updates) =>
      super.copyWith((message) => updates(message as Rpc_GatewayCloseAgentsReq))
          as Rpc_GatewayCloseAgentsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Rpc_GatewayCloseAgentsReq create() => Rpc_GatewayCloseAgentsReq._();
  @$core.override
  Rpc_GatewayCloseAgentsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Rpc_GatewayCloseAgentsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Rpc_GatewayCloseAgentsReq>(create);
  static Rpc_GatewayCloseAgentsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get userSessionIds => $_getList(0);
}

class Rpc_GatewayCloseAgentsResp extends $pb.GeneratedMessage {
  factory Rpc_GatewayCloseAgentsResp({
    ErrorData? errorData,
  }) {
    final result = create();
    if (errorData != null) result.errorData = errorData;
    return result;
  }

  Rpc_GatewayCloseAgentsResp._();

  factory Rpc_GatewayCloseAgentsResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Rpc_GatewayCloseAgentsResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Rpc_GatewayCloseAgentsResp',
      createEmptyInstance: create)
    ..aOM<ErrorData>(1, _omitFieldNames ? '' : 'ErrorData',
        protoName: 'ErrorData', subBuilder: ErrorData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Rpc_GatewayCloseAgentsResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Rpc_GatewayCloseAgentsResp copyWith(
          void Function(Rpc_GatewayCloseAgentsResp) updates) =>
      super.copyWith(
              (message) => updates(message as Rpc_GatewayCloseAgentsResp))
          as Rpc_GatewayCloseAgentsResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Rpc_GatewayCloseAgentsResp create() => Rpc_GatewayCloseAgentsResp._();
  @$core.override
  Rpc_GatewayCloseAgentsResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Rpc_GatewayCloseAgentsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Rpc_GatewayCloseAgentsResp>(create);
  static Rpc_GatewayCloseAgentsResp? _defaultInstance;

  @$pb.TagNumber(1)
  ErrorData get errorData => $_getN(0);
  @$pb.TagNumber(1)
  set errorData(ErrorData value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasErrorData() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrorData() => $_clearField(1);
  @$pb.TagNumber(1)
  ErrorData ensureErrorData() => $_ensure(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
