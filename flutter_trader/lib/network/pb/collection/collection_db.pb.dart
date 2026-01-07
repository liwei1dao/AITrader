// This is a generated file - do not edit.
//
// Generated from collection/collection_db.proto.

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

class DBCollectionItem extends $pb.GeneratedMessage {
  factory DBCollectionItem({
    $core.String? code,
    $fixnum.Int64? lastUpdateTime,
  }) {
    final result = create();
    if (code != null) result.code = code;
    if (lastUpdateTime != null) result.lastUpdateTime = lastUpdateTime;
    return result;
  }

  DBCollectionItem._();

  factory DBCollectionItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DBCollectionItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DBCollectionItem',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..aInt64(2, _omitFieldNames ? '' : 'lastUpdateTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DBCollectionItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DBCollectionItem copyWith(void Function(DBCollectionItem) updates) =>
      super.copyWith((message) => updates(message as DBCollectionItem))
          as DBCollectionItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DBCollectionItem create() => DBCollectionItem._();
  @$core.override
  DBCollectionItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DBCollectionItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DBCollectionItem>(create);
  static DBCollectionItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get lastUpdateTime => $_getI64(1);
  @$pb.TagNumber(2)
  set lastUpdateTime($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLastUpdateTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastUpdateTime() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
