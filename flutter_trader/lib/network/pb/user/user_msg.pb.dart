// This is a generated file - do not edit.
//
// Generated from user/user_msg.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'user_db.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// 登录请求
class UserSginReq extends $pb.GeneratedMessage {
  factory UserSginReq({
    $0.SginTyoe? stype,
    $core.String? mail,
    $core.String? phone,
    $core.String? ttoken,
    $core.String? vcode,
    $core.String? name,
    $core.String? avatar,
    $core.String? language,
  }) {
    final result = create();
    if (stype != null) result.stype = stype;
    if (mail != null) result.mail = mail;
    if (phone != null) result.phone = phone;
    if (ttoken != null) result.ttoken = ttoken;
    if (vcode != null) result.vcode = vcode;
    if (name != null) result.name = name;
    if (avatar != null) result.avatar = avatar;
    if (language != null) result.language = language;
    return result;
  }

  UserSginReq._();

  factory UserSginReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserSginReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserSginReq',
      createEmptyInstance: create)
    ..aE<$0.SginTyoe>(1, _omitFieldNames ? '' : 'stype',
        enumValues: $0.SginTyoe.values)
    ..aOS(2, _omitFieldNames ? '' : 'mail')
    ..aOS(3, _omitFieldNames ? '' : 'phone')
    ..aOS(4, _omitFieldNames ? '' : 'ttoken')
    ..aOS(5, _omitFieldNames ? '' : 'vcode')
    ..aOS(20, _omitFieldNames ? '' : 'name')
    ..aOS(21, _omitFieldNames ? '' : 'avatar')
    ..aOS(22, _omitFieldNames ? '' : 'language')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserSginReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserSginReq copyWith(void Function(UserSginReq) updates) =>
      super.copyWith((message) => updates(message as UserSginReq))
          as UserSginReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserSginReq create() => UserSginReq._();
  @$core.override
  UserSginReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserSginReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserSginReq>(create);
  static UserSginReq? _defaultInstance;

  @$pb.TagNumber(1)
  $0.SginTyoe get stype => $_getN(0);
  @$pb.TagNumber(1)
  set stype($0.SginTyoe value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStype() => $_has(0);
  @$pb.TagNumber(1)
  void clearStype() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get mail => $_getSZ(1);
  @$pb.TagNumber(2)
  set mail($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMail() => $_has(1);
  @$pb.TagNumber(2)
  void clearMail() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get phone => $_getSZ(2);
  @$pb.TagNumber(3)
  set phone($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPhone() => $_has(2);
  @$pb.TagNumber(3)
  void clearPhone() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get ttoken => $_getSZ(3);
  @$pb.TagNumber(4)
  set ttoken($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTtoken() => $_has(3);
  @$pb.TagNumber(4)
  void clearTtoken() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get vcode => $_getSZ(4);
  @$pb.TagNumber(5)
  set vcode($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasVcode() => $_has(4);
  @$pb.TagNumber(5)
  void clearVcode() => $_clearField(5);

  @$pb.TagNumber(20)
  $core.String get name => $_getSZ(5);
  @$pb.TagNumber(20)
  set name($core.String value) => $_setString(5, value);
  @$pb.TagNumber(20)
  $core.bool hasName() => $_has(5);
  @$pb.TagNumber(20)
  void clearName() => $_clearField(20);

  @$pb.TagNumber(21)
  $core.String get avatar => $_getSZ(6);
  @$pb.TagNumber(21)
  set avatar($core.String value) => $_setString(6, value);
  @$pb.TagNumber(21)
  $core.bool hasAvatar() => $_has(6);
  @$pb.TagNumber(21)
  void clearAvatar() => $_clearField(21);

  @$pb.TagNumber(22)
  $core.String get language => $_getSZ(7);
  @$pb.TagNumber(22)
  set language($core.String value) => $_setString(7, value);
  @$pb.TagNumber(22)
  $core.bool hasLanguage() => $_has(7);
  @$pb.TagNumber(22)
  void clearLanguage() => $_clearField(22);
}

class UserSginResp extends $pb.GeneratedMessage {
  factory UserSginResp({
    $core.String? token,
    $0.DBUser? user,
  }) {
    final result = create();
    if (token != null) result.token = token;
    if (user != null) result.user = user;
    return result;
  }

  UserSginResp._();

  factory UserSginResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserSginResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserSginResp',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'token')
    ..aOM<$0.DBUser>(2, _omitFieldNames ? '' : 'user',
        subBuilder: $0.DBUser.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserSginResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserSginResp copyWith(void Function(UserSginResp) updates) =>
      super.copyWith((message) => updates(message as UserSginResp))
          as UserSginResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserSginResp create() => UserSginResp._();
  @$core.override
  UserSginResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserSginResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserSginResp>(create);
  static UserSginResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.DBUser get user => $_getN(1);
  @$pb.TagNumber(2)
  set user($0.DBUser value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.DBUser ensureUser() => $_ensure(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
