// This is a generated file - do not edit.
//
// Generated from stock/stock_msg.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use stockGetRealTimeDataReqDescriptor instead')
const StockGetRealTimeDataReq$json = {
  '1': 'StockGetRealTimeDataReq',
  '2': [
    {'1': 'codes', '3': 1, '4': 3, '5': 9, '10': 'codes'},
  ],
};

/// Descriptor for `StockGetRealTimeDataReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stockGetRealTimeDataReqDescriptor =
    $convert.base64Decode(
        'ChdTdG9ja0dldFJlYWxUaW1lRGF0YVJlcRIUCgVjb2RlcxgBIAMoCVIFY29kZXM=');

@$core.Deprecated('Use stockGetRealTimeDataRespDescriptor instead')
const StockGetRealTimeDataResp$json = {
  '1': 'StockGetRealTimeDataResp',
  '2': [
    {
      '1': 'items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.DBStockRealTimeItem',
      '10': 'items'
    },
  ],
};

/// Descriptor for `StockGetRealTimeDataResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stockGetRealTimeDataRespDescriptor =
    $convert.base64Decode(
        'ChhTdG9ja0dldFJlYWxUaW1lRGF0YVJlc3ASKgoFaXRlbXMYASADKAsyFC5EQlN0b2NrUmVhbF'
        'RpbWVJdGVtUgVpdGVtcw==');

@$core.Deprecated('Use stockGetIntradayChartReqDescriptor instead')
const StockGetIntradayChartReq$json = {
  '1': 'StockGetIntradayChartReq',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
  ],
};

/// Descriptor for `StockGetIntradayChartReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stockGetIntradayChartReqDescriptor =
    $convert.base64Decode(
        'ChhTdG9ja0dldEludHJhZGF5Q2hhcnRSZXESEgoEY29kZRgBIAEoCVIEY29kZQ==');

@$core.Deprecated('Use stockGetIntradayChartRespDescriptor instead')
const StockGetIntradayChartResp$json = {
  '1': 'StockGetIntradayChartResp',
  '2': [
    {
      '1': 'items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.DBStockRealTimeItem',
      '10': 'items'
    },
  ],
};

/// Descriptor for `StockGetIntradayChartResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stockGetIntradayChartRespDescriptor =
    $convert.base64Decode(
        'ChlTdG9ja0dldEludHJhZGF5Q2hhcnRSZXNwEioKBWl0ZW1zGAEgAygLMhQuREJTdG9ja1JlYW'
        'xUaW1lSXRlbVIFaXRlbXM=');

@$core.Deprecated('Use stockGetHitDataReqDescriptor instead')
const StockGetHitDataReq$json = {
  '1': 'StockGetHitDataReq',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
    {'1': 'period', '3': 2, '4': 1, '5': 9, '10': 'period'},
  ],
};

/// Descriptor for `StockGetHitDataReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stockGetHitDataReqDescriptor = $convert.base64Decode(
    'ChJTdG9ja0dldEhpdERhdGFSZXESEgoEY29kZRgBIAEoCVIEY29kZRIWCgZwZXJpb2QYAiABKA'
    'lSBnBlcmlvZA==');

@$core.Deprecated('Use stockGetHitDataRespDescriptor instead')
const StockGetHitDataResp$json = {
  '1': 'StockGetHitDataResp',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.DBStockBar', '10': 'items'},
  ],
};

/// Descriptor for `StockGetHitDataResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stockGetHitDataRespDescriptor = $convert.base64Decode(
    'ChNTdG9ja0dldEhpdERhdGFSZXNwEiEKBWl0ZW1zGAEgAygLMgsuREJTdG9ja0JhclIFaXRlbX'
    'M=');

@$core.Deprecated('Use stockGetBasicInfoReqDescriptor instead')
const StockGetBasicInfoReq$json = {
  '1': 'StockGetBasicInfoReq',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
  ],
};

/// Descriptor for `StockGetBasicInfoReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stockGetBasicInfoReqDescriptor = $convert
    .base64Decode('ChRTdG9ja0dldEJhc2ljSW5mb1JlcRISCgRjb2RlGAEgASgJUgRjb2Rl');

@$core.Deprecated('Use stockGetBasicInfoRespDescriptor instead')
const StockGetBasicInfoResp$json = {
  '1': 'StockGetBasicInfoResp',
  '2': [
    {
      '1': 'info',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.DBStockBasicInfo',
      '10': 'info'
    },
  ],
};

/// Descriptor for `StockGetBasicInfoResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stockGetBasicInfoRespDescriptor = $convert.base64Decode(
    'ChVTdG9ja0dldEJhc2ljSW5mb1Jlc3ASJQoEaW5mbxgBIAEoCzIRLkRCU3RvY2tCYXNpY0luZm'
    '9SBGluZm8=');

@$core.Deprecated('Use stockGetOperatingSnapshotReqDescriptor instead')
const StockGetOperatingSnapshotReq$json = {
  '1': 'StockGetOperatingSnapshotReq',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
  ],
};

/// Descriptor for `StockGetOperatingSnapshotReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stockGetOperatingSnapshotReqDescriptor =
    $convert.base64Decode(
        'ChxTdG9ja0dldE9wZXJhdGluZ1NuYXBzaG90UmVxEhIKBGNvZGUYASABKAlSBGNvZGU=');

@$core.Deprecated('Use stockGetOperatingSnapshotRespDescriptor instead')
const StockGetOperatingSnapshotResp$json = {
  '1': 'StockGetOperatingSnapshotResp',
  '2': [
    {
      '1': 'snapshots',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.DBStockOperatingSnapshot',
      '10': 'snapshots'
    },
  ],
};

/// Descriptor for `StockGetOperatingSnapshotResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stockGetOperatingSnapshotRespDescriptor =
    $convert.base64Decode(
        'Ch1TdG9ja0dldE9wZXJhdGluZ1NuYXBzaG90UmVzcBI3CglzbmFwc2hvdHMYASADKAsyGS5EQl'
        'N0b2NrT3BlcmF0aW5nU25hcHNob3RSCXNuYXBzaG90cw==');
