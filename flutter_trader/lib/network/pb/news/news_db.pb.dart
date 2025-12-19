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
class DBRealTimeGlobalNews extends $pb.GeneratedMessage {
  factory DBRealTimeGlobalNews({
    $core.String? title,
    $core.String? content,
    $core.String? publishTime,
    $core.String? url,
  }) {
    final result = create();
    if (title != null) result.title = title;
    if (content != null) result.content = content;
    if (publishTime != null) result.publishTime = publishTime;
    if (url != null) result.url = url;
    return result;
  }

  DBRealTimeGlobalNews._();

  factory DBRealTimeGlobalNews.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DBRealTimeGlobalNews.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DBRealTimeGlobalNews',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..aOS(3, _omitFieldNames ? '' : 'publishTime')
    ..aOS(4, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DBRealTimeGlobalNews clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DBRealTimeGlobalNews copyWith(void Function(DBRealTimeGlobalNews) updates) =>
      super.copyWith((message) => updates(message as DBRealTimeGlobalNews))
          as DBRealTimeGlobalNews;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DBRealTimeGlobalNews create() => DBRealTimeGlobalNews._();
  @$core.override
  DBRealTimeGlobalNews createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DBRealTimeGlobalNews getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DBRealTimeGlobalNews>(create);
  static DBRealTimeGlobalNews? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get publishTime => $_getSZ(2);
  @$pb.TagNumber(3)
  set publishTime($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPublishTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearPublishTime() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get url => $_getSZ(3);
  @$pb.TagNumber(4)
  set url($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearUrl() => $_clearField(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
