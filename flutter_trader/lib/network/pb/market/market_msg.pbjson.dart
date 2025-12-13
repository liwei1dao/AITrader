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

@$core.Deprecated('Use marketGetSpotsReqDescriptor instead')
const MarketGetSpotsReq$json = {
  '1': 'MarketGetSpotsReq',
};

/// Descriptor for `MarketGetSpotsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketGetSpotsReqDescriptor =
    $convert.base64Decode('ChFNYXJrZXRHZXRTcG90c1JlcQ==');

@$core.Deprecated('Use marketGetSpotsRespDescriptor instead')
const MarketGetSpotsResp$json = {
  '1': 'MarketGetSpotsResp',
  '2': [
    {
      '1': 'Items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.DBMarketSpotItem',
      '10': 'Items'
    },
  ],
};

/// Descriptor for `MarketGetSpotsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketGetSpotsRespDescriptor = $convert.base64Decode(
    'ChJNYXJrZXRHZXRTcG90c1Jlc3ASJwoFSXRlbXMYASADKAsyES5EQk1hcmtldFNwb3RJdGVtUg'
    'VJdGVtcw==');
