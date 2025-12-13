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

import 'package:protobuf/protobuf.dart' as $pb;

class SginTyoe extends $pb.ProtobufEnum {
  /// 邮箱登录
  /// @Description 邮箱登录
  /// @example
  static const SginTyoe Mail = SginTyoe._(0, _omitEnumNames ? '' : 'Mail');

  /// 手机登录
  /// @Description 手机登录
  /// @example
  static const SginTyoe Phone = SginTyoe._(1, _omitEnumNames ? '' : 'Phone');

  /// 微信登录
  /// @Description 微信登录
  /// @example
  static const SginTyoe WXChat = SginTyoe._(2, _omitEnumNames ? '' : 'WXChat');

  /// google登录
  /// @Description google登录
  /// @example
  static const SginTyoe Google = SginTyoe._(3, _omitEnumNames ? '' : 'Google');

  /// facebook登录
  /// @Description facebook登录
  /// @example
  static const SginTyoe FaceBook =
      SginTyoe._(4, _omitEnumNames ? '' : 'FaceBook');

  /// firebase 登录
  /// @Description
  /// @example
  static const SginTyoe Apple = SginTyoe._(5, _omitEnumNames ? '' : 'Apple');

  /// 账号登录
  /// @Description 账号登录 账号密码登录
  /// @example
  static const SginTyoe Account =
      SginTyoe._(6, _omitEnumNames ? '' : 'Account');

  /// token登录
  /// @Description token登录
  /// @example
  static const SginTyoe Token = SginTyoe._(10, _omitEnumNames ? '' : 'Token');

  static const $core.List<SginTyoe> values = <SginTyoe>[
    Mail,
    Phone,
    WXChat,
    Google,
    FaceBook,
    Apple,
    Account,
    Token,
  ];

  static final $core.List<SginTyoe?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 10);
  static SginTyoe? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SginTyoe._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
