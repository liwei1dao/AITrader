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
class NewsMarketNewsReq extends $pb.GeneratedMessage {
  factory NewsMarketNewsReq() => create();

  NewsMarketNewsReq._();

  factory NewsMarketNewsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NewsMarketNewsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NewsMarketNewsReq',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewsMarketNewsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewsMarketNewsReq copyWith(void Function(NewsMarketNewsReq) updates) =>
      super.copyWith((message) => updates(message as NewsMarketNewsReq))
          as NewsMarketNewsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewsMarketNewsReq create() => NewsMarketNewsReq._();
  @$core.override
  NewsMarketNewsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NewsMarketNewsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NewsMarketNewsReq>(create);
  static NewsMarketNewsReq? _defaultInstance;
}

class NewsMarketNewsResp extends $pb.GeneratedMessage {
  factory NewsMarketNewsResp({
    $core.Iterable<$0.DBMarketNews>? news,
  }) {
    final result = create();
    if (news != null) result.news.addAll(news);
    return result;
  }

  NewsMarketNewsResp._();

  factory NewsMarketNewsResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NewsMarketNewsResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NewsMarketNewsResp',
      createEmptyInstance: create)
    ..pPM<$0.DBMarketNews>(1, _omitFieldNames ? '' : 'news',
        subBuilder: $0.DBMarketNews.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewsMarketNewsResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewsMarketNewsResp copyWith(void Function(NewsMarketNewsResp) updates) =>
      super.copyWith((message) => updates(message as NewsMarketNewsResp))
          as NewsMarketNewsResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewsMarketNewsResp create() => NewsMarketNewsResp._();
  @$core.override
  NewsMarketNewsResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NewsMarketNewsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NewsMarketNewsResp>(create);
  static NewsMarketNewsResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.DBMarketNews> get news => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
