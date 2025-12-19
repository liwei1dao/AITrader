// This is a generated file - do not edit.
//
// Generated from news/news_msg.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'news_db.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// 获取市场新闻请求
class NewsGetRealTimeGlobalNewsReq extends $pb.GeneratedMessage {
  factory NewsGetRealTimeGlobalNewsReq() => create();

  NewsGetRealTimeGlobalNewsReq._();

  factory NewsGetRealTimeGlobalNewsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NewsGetRealTimeGlobalNewsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NewsGetRealTimeGlobalNewsReq',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewsGetRealTimeGlobalNewsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewsGetRealTimeGlobalNewsReq copyWith(
          void Function(NewsGetRealTimeGlobalNewsReq) updates) =>
      super.copyWith(
              (message) => updates(message as NewsGetRealTimeGlobalNewsReq))
          as NewsGetRealTimeGlobalNewsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewsGetRealTimeGlobalNewsReq create() =>
      NewsGetRealTimeGlobalNewsReq._();
  @$core.override
  NewsGetRealTimeGlobalNewsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NewsGetRealTimeGlobalNewsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NewsGetRealTimeGlobalNewsReq>(create);
  static NewsGetRealTimeGlobalNewsReq? _defaultInstance;
}

class NewsGetRealTimeGlobalNewsResp extends $pb.GeneratedMessage {
  factory NewsGetRealTimeGlobalNewsResp({
    $core.Iterable<$0.DBRealTimeGlobalNews>? news,
  }) {
    final result = create();
    if (news != null) result.news.addAll(news);
    return result;
  }

  NewsGetRealTimeGlobalNewsResp._();

  factory NewsGetRealTimeGlobalNewsResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NewsGetRealTimeGlobalNewsResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NewsGetRealTimeGlobalNewsResp',
      createEmptyInstance: create)
    ..pPM<$0.DBRealTimeGlobalNews>(1, _omitFieldNames ? '' : 'news',
        subBuilder: $0.DBRealTimeGlobalNews.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewsGetRealTimeGlobalNewsResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewsGetRealTimeGlobalNewsResp copyWith(
          void Function(NewsGetRealTimeGlobalNewsResp) updates) =>
      super.copyWith(
              (message) => updates(message as NewsGetRealTimeGlobalNewsResp))
          as NewsGetRealTimeGlobalNewsResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewsGetRealTimeGlobalNewsResp create() =>
      NewsGetRealTimeGlobalNewsResp._();
  @$core.override
  NewsGetRealTimeGlobalNewsResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NewsGetRealTimeGlobalNewsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NewsGetRealTimeGlobalNewsResp>(create);
  static NewsGetRealTimeGlobalNewsResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.DBRealTimeGlobalNews> get news => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
