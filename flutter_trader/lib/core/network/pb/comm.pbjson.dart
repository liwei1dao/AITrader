// This is a generated file - do not edit.
//
// Generated from comm.proto.

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

@$core.Deprecated('Use errorDataDescriptor instead')
const ErrorData$json = {
  '1': 'ErrorData',
  '2': [
    {'1': 'Code', '3': 1, '4': 1, '5': 14, '6': '.ErrorCode', '10': 'Code'},
    {'1': 'Message', '3': 2, '4': 1, '5': 9, '10': 'Message'},
  ],
};

/// Descriptor for `ErrorData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List errorDataDescriptor = $convert.base64Decode(
    'CglFcnJvckRhdGESHgoEQ29kZRgBIAEoDjIKLkVycm9yQ29kZVIEQ29kZRIYCgdNZXNzYWdlGA'
    'IgASgJUgdNZXNzYWdl');

@$core.Deprecated('Use rpc_GatewayHttpRouteReqDescriptor instead')
const Rpc_GatewayHttpRouteReq$json = {
  '1': 'Rpc_GatewayHttpRouteReq',
  '2': [
    {'1': 'MsgName', '3': 1, '4': 1, '5': 9, '10': 'MsgName'},
    {
      '1': 'Meta',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.Rpc_GatewayHttpRouteReq.MetaEntry',
      '10': 'Meta'
    },
    {'1': 'Message', '3': 3, '4': 1, '5': 12, '10': 'Message'},
  ],
  '3': [Rpc_GatewayHttpRouteReq_MetaEntry$json],
};

@$core.Deprecated('Use rpc_GatewayHttpRouteReqDescriptor instead')
const Rpc_GatewayHttpRouteReq_MetaEntry$json = {
  '1': 'MetaEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Rpc_GatewayHttpRouteReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rpc_GatewayHttpRouteReqDescriptor = $convert.base64Decode(
    'ChdScGNfR2F0ZXdheUh0dHBSb3V0ZVJlcRIYCgdNc2dOYW1lGAEgASgJUgdNc2dOYW1lEjYKBE'
    '1ldGEYAiADKAsyIi5ScGNfR2F0ZXdheUh0dHBSb3V0ZVJlcS5NZXRhRW50cnlSBE1ldGESGAoH'
    'TWVzc2FnZRgDIAEoDFIHTWVzc2FnZRo3CglNZXRhRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFA'
    'oFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use rpc_GatewayHttpRouteRespDescriptor instead')
const Rpc_GatewayHttpRouteResp$json = {
  '1': 'Rpc_GatewayHttpRouteResp',
  '2': [
    {'1': 'ContentType', '3': 1, '4': 1, '5': 9, '10': 'ContentType'},
    {'1': 'Body', '3': 2, '4': 1, '5': 12, '10': 'Body'},
  ],
};

/// Descriptor for `Rpc_GatewayHttpRouteResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rpc_GatewayHttpRouteRespDescriptor =
    $convert.base64Decode(
        'ChhScGNfR2F0ZXdheUh0dHBSb3V0ZVJlc3ASIAoLQ29udGVudFR5cGUYASABKAlSC0NvbnRlbn'
        'RUeXBlEhIKBEJvZHkYAiABKAxSBEJvZHk=');

@$core.Deprecated('Use messagePackageDescriptor instead')
const MessagePackage$json = {
  '1': 'MessagePackage',
  '2': [
    {
      '1': 'messages',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.SocketMessage',
      '10': 'messages'
    },
  ],
};

/// Descriptor for `MessagePackage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messagePackageDescriptor = $convert.base64Decode(
    'Cg5NZXNzYWdlUGFja2FnZRIqCghtZXNzYWdlcxgBIAMoCzIOLlNvY2tldE1lc3NhZ2VSCG1lc3'
    'NhZ2Vz');

@$core.Deprecated('Use socketMessageDescriptor instead')
const SocketMessage$json = {
  '1': 'SocketMessage',
  '2': [
    {'1': 'MsgName', '3': 1, '4': 1, '5': 9, '10': 'MsgName'},
    {'1': 'servicePath', '3': 2, '4': 1, '5': 9, '10': 'servicePath'},
    {
      '1': 'data',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Any',
      '10': 'data'
    },
    {'1': 'sec', '3': 4, '4': 1, '5': 9, '10': 'sec'},
  ],
};

/// Descriptor for `SocketMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List socketMessageDescriptor = $convert.base64Decode(
    'Cg1Tb2NrZXRNZXNzYWdlEhgKB01zZ05hbWUYASABKAlSB01zZ05hbWUSIAoLc2VydmljZVBhdG'
    'gYAiABKAlSC3NlcnZpY2VQYXRoEigKBGRhdGEYAyABKAsyFC5nb29nbGUucHJvdG9idWYuQW55'
    'UgRkYXRhEhAKA3NlYxgEIAEoCVIDc2Vj');
