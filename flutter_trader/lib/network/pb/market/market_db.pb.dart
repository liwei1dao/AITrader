// This is a generated file - do not edit.
//
// Generated from market/market_db.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// 指数实时快照（东方财富 stock_zh_index_spot）
class DBMarketSpotItem extends $pb.GeneratedMessage {
  factory DBMarketSpotItem({
    $core.String? code,
    $core.String? name,
    $core.double? last,
    $core.double? changePct,
    $core.double? turnOver,
  }) {
    final result = create();
    if (code != null) result.code = code;
    if (name != null) result.name = name;
    if (last != null) result.last = last;
    if (changePct != null) result.changePct = changePct;
    if (turnOver != null) result.turnOver = turnOver;
    return result;
  }

  DBMarketSpotItem._();

  factory DBMarketSpotItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DBMarketSpotItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DBMarketSpotItem',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Code', protoName: 'Code')
    ..aOS(2, _omitFieldNames ? '' : 'Name', protoName: 'Name')
    ..aD(3, _omitFieldNames ? '' : 'Last', protoName: 'Last')
    ..aD(4, _omitFieldNames ? '' : 'ChangePct', protoName: 'ChangePct')
    ..aD(5, _omitFieldNames ? '' : 'TurnOver', protoName: 'TurnOver')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DBMarketSpotItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DBMarketSpotItem copyWith(void Function(DBMarketSpotItem) updates) =>
      super.copyWith((message) => updates(message as DBMarketSpotItem))
          as DBMarketSpotItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DBMarketSpotItem create() => DBMarketSpotItem._();
  @$core.override
  DBMarketSpotItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DBMarketSpotItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DBMarketSpotItem>(create);
  static DBMarketSpotItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get last => $_getN(2);
  @$pb.TagNumber(3)
  set last($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLast() => $_has(2);
  @$pb.TagNumber(3)
  void clearLast() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get changePct => $_getN(3);
  @$pb.TagNumber(4)
  set changePct($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasChangePct() => $_has(3);
  @$pb.TagNumber(4)
  void clearChangePct() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get turnOver => $_getN(4);
  @$pb.TagNumber(5)
  set turnOver($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTurnOver() => $_has(4);
  @$pb.TagNumber(5)
  void clearTurnOver() => $_clearField(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
