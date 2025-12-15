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

@$core.Deprecated('Use stockGetInfosReqDescriptor instead')
const StockGetInfosReq$json = {
  '1': 'StockGetInfosReq',
  '2': [
    {'1': 'stock_ids', '3': 1, '4': 3, '5': 9, '10': 'stockIds'},
  ],
};

/// Descriptor for `StockGetInfosReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stockGetInfosReqDescriptor = $convert.base64Decode(
    'ChBTdG9ja0dldEluZm9zUmVxEhsKCXN0b2NrX2lkcxgBIAMoCVIIc3RvY2tJZHM=');

@$core.Deprecated('Use stockGetInfosRespDescriptor instead')
const StockGetInfosResp$json = {
  '1': 'StockGetInfosResp',
  '2': [
    {
      '1': 'stock_infos',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.DBStockIdentity',
      '10': 'stockInfos'
    },
  ],
};

/// Descriptor for `StockGetInfosResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stockGetInfosRespDescriptor = $convert.base64Decode(
    'ChFTdG9ja0dldEluZm9zUmVzcBIxCgtzdG9ja19pbmZvcxgBIAMoCzIQLkRCU3RvY2tJZGVudG'
    'l0eVIKc3RvY2tJbmZvcw==');

@$core.Deprecated('Use stockGetFundamentalSnapshotReqDescriptor instead')
const StockGetFundamentalSnapshotReq$json = {
  '1': 'StockGetFundamentalSnapshotReq',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `StockGetFundamentalSnapshotReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stockGetFundamentalSnapshotReqDescriptor =
    $convert.base64Decode(
        'Ch5TdG9ja0dldEZ1bmRhbWVudGFsU25hcHNob3RSZXESDgoCaWQYASABKAlSAmlk');

@$core.Deprecated('Use stockGetFundamentalSnapshotRespDescriptor instead')
const StockGetFundamentalSnapshotResp$json = {
  '1': 'StockGetFundamentalSnapshotResp',
  '2': [
    {
      '1': 'snapshots',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.DBFundamentalSnapshot',
      '10': 'snapshots'
    },
  ],
};

/// Descriptor for `StockGetFundamentalSnapshotResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stockGetFundamentalSnapshotRespDescriptor =
    $convert.base64Decode(
        'Ch9TdG9ja0dldEZ1bmRhbWVudGFsU25hcHNob3RSZXNwEjQKCXNuYXBzaG90cxgBIAMoCzIWLk'
        'RCRnVuZGFtZW50YWxTbmFwc2hvdFIJc25hcHNob3Rz');
