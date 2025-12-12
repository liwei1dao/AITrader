// This is a generated file - do not edit.
//
// Generated from user/user_db.proto.

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

export 'user_db.pbenum.dart';

/// 用户数据
class DBUser extends $pb.GeneratedMessage {
  factory DBUser({
    $core.String? uid,
    $core.String? mail,
    $core.String? phone,
    $core.String? name,
    $core.String? avatar,
    $core.String? account,
    $core.String? password,
    $fixnum.Int64? createtime,
    $core.String? language,
    $core.String? servicetag,
    $core.String? wxopenid,
    $core.String? googleopenid,
    $core.String? facebookopenid,
    $core.String? appleopenid,
    $fixnum.Int64? lastsgintime,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (mail != null) result.mail = mail;
    if (phone != null) result.phone = phone;
    if (name != null) result.name = name;
    if (avatar != null) result.avatar = avatar;
    if (account != null) result.account = account;
    if (password != null) result.password = password;
    if (createtime != null) result.createtime = createtime;
    if (language != null) result.language = language;
    if (servicetag != null) result.servicetag = servicetag;
    if (wxopenid != null) result.wxopenid = wxopenid;
    if (googleopenid != null) result.googleopenid = googleopenid;
    if (facebookopenid != null) result.facebookopenid = facebookopenid;
    if (appleopenid != null) result.appleopenid = appleopenid;
    if (lastsgintime != null) result.lastsgintime = lastsgintime;
    return result;
  }

  DBUser._();

  factory DBUser.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DBUser.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DBUser',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uid')
    ..aOS(2, _omitFieldNames ? '' : 'mail')
    ..aOS(3, _omitFieldNames ? '' : 'phone')
    ..aOS(5, _omitFieldNames ? '' : 'name')
    ..aOS(8, _omitFieldNames ? '' : 'avatar')
    ..aOS(12, _omitFieldNames ? '' : 'account')
    ..aOS(13, _omitFieldNames ? '' : 'password')
    ..aInt64(14, _omitFieldNames ? '' : 'createtime')
    ..aOS(15, _omitFieldNames ? '' : 'language')
    ..aOS(16, _omitFieldNames ? '' : 'servicetag')
    ..aOS(17, _omitFieldNames ? '' : 'wxopenid')
    ..aOS(18, _omitFieldNames ? '' : 'googleopenid')
    ..aOS(19, _omitFieldNames ? '' : 'facebookopenid')
    ..aOS(20, _omitFieldNames ? '' : 'appleopenid')
    ..aInt64(21, _omitFieldNames ? '' : 'lastsgintime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DBUser clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DBUser copyWith(void Function(DBUser) updates) =>
      super.copyWith((message) => updates(message as DBUser)) as DBUser;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DBUser create() => DBUser._();
  @$core.override
  DBUser createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DBUser getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DBUser>(create);
  static DBUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

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

  @$pb.TagNumber(5)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(5)
  set name($core.String value) => $_setString(3, value);
  @$pb.TagNumber(5)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(5)
  void clearName() => $_clearField(5);

  @$pb.TagNumber(8)
  $core.String get avatar => $_getSZ(4);
  @$pb.TagNumber(8)
  set avatar($core.String value) => $_setString(4, value);
  @$pb.TagNumber(8)
  $core.bool hasAvatar() => $_has(4);
  @$pb.TagNumber(8)
  void clearAvatar() => $_clearField(8);

  @$pb.TagNumber(12)
  $core.String get account => $_getSZ(5);
  @$pb.TagNumber(12)
  set account($core.String value) => $_setString(5, value);
  @$pb.TagNumber(12)
  $core.bool hasAccount() => $_has(5);
  @$pb.TagNumber(12)
  void clearAccount() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get password => $_getSZ(6);
  @$pb.TagNumber(13)
  set password($core.String value) => $_setString(6, value);
  @$pb.TagNumber(13)
  $core.bool hasPassword() => $_has(6);
  @$pb.TagNumber(13)
  void clearPassword() => $_clearField(13);

  @$pb.TagNumber(14)
  $fixnum.Int64 get createtime => $_getI64(7);
  @$pb.TagNumber(14)
  set createtime($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(14)
  $core.bool hasCreatetime() => $_has(7);
  @$pb.TagNumber(14)
  void clearCreatetime() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.String get language => $_getSZ(8);
  @$pb.TagNumber(15)
  set language($core.String value) => $_setString(8, value);
  @$pb.TagNumber(15)
  $core.bool hasLanguage() => $_has(8);
  @$pb.TagNumber(15)
  void clearLanguage() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.String get servicetag => $_getSZ(9);
  @$pb.TagNumber(16)
  set servicetag($core.String value) => $_setString(9, value);
  @$pb.TagNumber(16)
  $core.bool hasServicetag() => $_has(9);
  @$pb.TagNumber(16)
  void clearServicetag() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.String get wxopenid => $_getSZ(10);
  @$pb.TagNumber(17)
  set wxopenid($core.String value) => $_setString(10, value);
  @$pb.TagNumber(17)
  $core.bool hasWxopenid() => $_has(10);
  @$pb.TagNumber(17)
  void clearWxopenid() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.String get googleopenid => $_getSZ(11);
  @$pb.TagNumber(18)
  set googleopenid($core.String value) => $_setString(11, value);
  @$pb.TagNumber(18)
  $core.bool hasGoogleopenid() => $_has(11);
  @$pb.TagNumber(18)
  void clearGoogleopenid() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.String get facebookopenid => $_getSZ(12);
  @$pb.TagNumber(19)
  set facebookopenid($core.String value) => $_setString(12, value);
  @$pb.TagNumber(19)
  $core.bool hasFacebookopenid() => $_has(12);
  @$pb.TagNumber(19)
  void clearFacebookopenid() => $_clearField(19);

  @$pb.TagNumber(20)
  $core.String get appleopenid => $_getSZ(13);
  @$pb.TagNumber(20)
  set appleopenid($core.String value) => $_setString(13, value);
  @$pb.TagNumber(20)
  $core.bool hasAppleopenid() => $_has(13);
  @$pb.TagNumber(20)
  void clearAppleopenid() => $_clearField(20);

  @$pb.TagNumber(21)
  $fixnum.Int64 get lastsgintime => $_getI64(14);
  @$pb.TagNumber(21)
  set lastsgintime($fixnum.Int64 value) => $_setInt64(14, value);
  @$pb.TagNumber(21)
  $core.bool hasLastsgintime() => $_has(14);
  @$pb.TagNumber(21)
  void clearLastsgintime() => $_clearField(21);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
