// This is a generated file - do not edit.
//
// Generated from gateway/gateway_msg.proto.

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

@$core.Deprecated('Use gatewayHeartbeatReqDescriptor instead')
const GatewayHeartbeatReq$json = {
  '1': 'GatewayHeartbeatReq',
};

/// Descriptor for `GatewayHeartbeatReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gatewayHeartbeatReqDescriptor =
    $convert.base64Decode('ChNHYXRld2F5SGVhcnRiZWF0UmVx');

@$core.Deprecated('Use gatewayHeartbeatRespDescriptor instead')
const GatewayHeartbeatResp$json = {
  '1': 'GatewayHeartbeatResp',
  '2': [
    {'1': 'timestamp', '3': 1, '4': 1, '5': 3, '10': 'timestamp'},
  ],
};

/// Descriptor for `GatewayHeartbeatResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gatewayHeartbeatRespDescriptor = $convert.base64Decode(
    'ChRHYXRld2F5SGVhcnRiZWF0UmVzcBIcCgl0aW1lc3RhbXAYASABKANSCXRpbWVzdGFtcA==');

@$core.Deprecated('Use gatewayErrorNotifyPushDescriptor instead')
const GatewayErrorNotifyPush$json = {
  '1': 'GatewayErrorNotifyPush',
  '2': [
    {'1': 'MsgName', '3': 1, '4': 1, '5': 9, '10': 'MsgName'},
    {'1': 'ServicePath', '3': 2, '4': 1, '5': 9, '10': 'ServicePath'},
    {
      '1': 'Req',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Any',
      '10': 'Req'
    },
    {'1': 'Error', '3': 4, '4': 1, '5': 11, '6': '.ErrorData', '10': 'Error'},
  ],
};

/// Descriptor for `GatewayErrorNotifyPush`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gatewayErrorNotifyPushDescriptor = $convert.base64Decode(
    'ChZHYXRld2F5RXJyb3JOb3RpZnlQdXNoEhgKB01zZ05hbWUYASABKAlSB01zZ05hbWUSIAoLU2'
    'VydmljZVBhdGgYAiABKAlSC1NlcnZpY2VQYXRoEiYKA1JlcRgDIAEoCzIULmdvb2dsZS5wcm90'
    'b2J1Zi5BbnlSA1JlcRIgCgVFcnJvchgEIAEoCzIKLkVycm9yRGF0YVIFRXJyb3I=');
