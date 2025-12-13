// This is a generated file - do not edit.
//
// Generated from news/news_db.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// / 市场新闻
class DBMarketNews extends $pb.GeneratedMessage {
  factory DBMarketNews({
    $core.String? id,
    $core.String? tag,
    $core.String? summary,
    $core.String? intervalTime,
    $core.String? pubTime,
    $core.String? url,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (tag != null) result.tag = tag;
    if (summary != null) result.summary = summary;
    if (intervalTime != null) result.intervalTime = intervalTime;
    if (pubTime != null) result.pubTime = pubTime;
    if (url != null) result.url = url;
    return result;
  }

  DBMarketNews._();

  factory DBMarketNews.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DBMarketNews.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DBMarketNews',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'tag')
    ..aOS(3, _omitFieldNames ? '' : 'summary')
    ..aOS(4, _omitFieldNames ? '' : 'intervalTime')
    ..aOS(5, _omitFieldNames ? '' : 'pubTime')
    ..aOS(6, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DBMarketNews clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DBMarketNews copyWith(void Function(DBMarketNews) updates) =>
      super.copyWith((message) => updates(message as DBMarketNews))
          as DBMarketNews;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DBMarketNews create() => DBMarketNews._();
  @$core.override
  DBMarketNews createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DBMarketNews getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DBMarketNews>(create);
  static DBMarketNews? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get tag => $_getSZ(1);
  @$pb.TagNumber(2)
  set tag($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTag() => $_has(1);
  @$pb.TagNumber(2)
  void clearTag() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get summary => $_getSZ(2);
  @$pb.TagNumber(3)
  set summary($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSummary() => $_has(2);
  @$pb.TagNumber(3)
  void clearSummary() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get intervalTime => $_getSZ(3);
  @$pb.TagNumber(4)
  set intervalTime($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIntervalTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearIntervalTime() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get pubTime => $_getSZ(4);
  @$pb.TagNumber(5)
  set pubTime($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPubTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearPubTime() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get url => $_getSZ(5);
  @$pb.TagNumber(6)
  set url($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearUrl() => $_clearField(6);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
