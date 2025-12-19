// This is a generated file - do not edit.
//
// Generated from market/market_msg.proto.

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

@$core.Deprecated('Use marketGetRealTimeIndexsReqDescriptor instead')
const MarketGetRealTimeIndexsReq$json = {
  '1': 'MarketGetRealTimeIndexsReq',
};

/// Descriptor for `MarketGetRealTimeIndexsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketGetRealTimeIndexsReqDescriptor =
    $convert.base64Decode('ChpNYXJrZXRHZXRSZWFsVGltZUluZGV4c1JlcQ==');

@$core.Deprecated('Use marketGetRealTimeIndexsRespDescriptor instead')
const MarketGetRealTimeIndexsResp$json = {
  '1': 'MarketGetRealTimeIndexsResp',
  '2': [
    {
      '1': 'Items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.DBMarketIndexRealTimeItem',
      '10': 'Items'
    },
  ],
};

/// Descriptor for `MarketGetRealTimeIndexsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketGetRealTimeIndexsRespDescriptor =
    $convert.base64Decode(
        'ChtNYXJrZXRHZXRSZWFsVGltZUluZGV4c1Jlc3ASMAoFSXRlbXMYASADKAsyGi5EQk1hcmtldE'
        'luZGV4UmVhbFRpbWVJdGVtUgVJdGVtcw==');
