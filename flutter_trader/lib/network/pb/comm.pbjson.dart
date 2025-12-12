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
    {'1': 'ServicePath', '3': 2, '4': 1, '5': 9, '10': 'ServicePath'},
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
    'Cg1Tb2NrZXRNZXNzYWdlEhgKB01zZ05hbWUYASABKAlSB01zZ05hbWUSIAoLU2VydmljZVBhdG'
    'gYAiABKAlSC1NlcnZpY2VQYXRoEigKBGRhdGEYAyABKAsyFC5nb29nbGUucHJvdG9idWYuQW55'
    'UgRkYXRhEhAKA3NlYxgEIAEoCVIDc2Vj');

@$core.Deprecated('Use rpc_GatewayHttpRouteReqDescriptor instead')
const Rpc_GatewayHttpRouteReq$json = {
  '1': 'Rpc_GatewayHttpRouteReq',
  '2': [
    {'1': 'MsgName', '3': 1, '4': 1, '5': 9, '10': 'MsgName'},
    {'1': 'Meta', '3': 2, '4': 1, '5': 9, '10': 'Meta'},
    {'1': 'Message', '3': 3, '4': 1, '5': 12, '10': 'Message'},
  ],
};

/// Descriptor for `Rpc_GatewayHttpRouteReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rpc_GatewayHttpRouteReqDescriptor =
    $convert.base64Decode(
        'ChdScGNfR2F0ZXdheUh0dHBSb3V0ZVJlcRIYCgdNc2dOYW1lGAEgASgJUgdNc2dOYW1lEhIKBE'
        '1ldGEYAiABKAlSBE1ldGESGAoHTWVzc2FnZRgDIAEoDFIHTWVzc2FnZQ==');

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

@$core.Deprecated('Use rpc_GatewaySocketRouteReqDescriptor instead')
const Rpc_GatewaySocketRouteReq$json = {
  '1': 'Rpc_GatewaySocketRouteReq',
  '2': [
    {'1': 'MsgName', '3': 1, '4': 1, '5': 9, '10': 'MsgName'},
    {'1': 'Meta', '3': 2, '4': 1, '5': 9, '10': 'Meta'},
    {
      '1': 'Message',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Any',
      '10': 'Message'
    },
  ],
};

/// Descriptor for `Rpc_GatewaySocketRouteReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rpc_GatewaySocketRouteReqDescriptor = $convert.base64Decode(
    'ChlScGNfR2F0ZXdheVNvY2tldFJvdXRlUmVxEhgKB01zZ05hbWUYASABKAlSB01zZ05hbWUSEg'
    'oETWV0YRgCIAEoCVIETWV0YRIuCgdNZXNzYWdlGAMgASgLMhQuZ29vZ2xlLnByb3RvYnVmLkFu'
    'eVIHTWVzc2FnZQ==');

@$core.Deprecated('Use rpc_GatewaySocketRouteRespDescriptor instead')
const Rpc_GatewaySocketRouteResp$json = {
  '1': 'Rpc_GatewaySocketRouteResp',
  '2': [
    {'1': 'ServicePath', '3': 1, '4': 1, '5': 9, '10': 'ServicePath'},
    {'1': 'ChangeMeta', '3': 2, '4': 1, '5': 9, '10': 'ChangeMeta'},
    {
      '1': 'Reply',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.SocketMessage',
      '10': 'Reply'
    },
    {
      '1': 'ErrorData',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.ErrorData',
      '10': 'ErrorData'
    },
  ],
};

/// Descriptor for `Rpc_GatewaySocketRouteResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rpc_GatewaySocketRouteRespDescriptor = $convert.base64Decode(
    'ChpScGNfR2F0ZXdheVNvY2tldFJvdXRlUmVzcBIgCgtTZXJ2aWNlUGF0aBgBIAEoCVILU2Vydm'
    'ljZVBhdGgSHgoKQ2hhbmdlTWV0YRgCIAEoCVIKQ2hhbmdlTWV0YRIkCgVSZXBseRgDIAMoCzIO'
    'LlNvY2tldE1lc3NhZ2VSBVJlcGx5EigKCUVycm9yRGF0YRgEIAEoCzIKLkVycm9yRGF0YVIJRX'
    'Jyb3JEYXRh');

@$core.Deprecated('Use rpc_GatewaySendMsgToAgentReqDescriptor instead')
const Rpc_GatewaySendMsgToAgentReq$json = {
  '1': 'Rpc_GatewaySendMsgToAgentReq',
  '2': [
    {'1': 'UserSessionId', '3': 1, '4': 1, '5': 9, '10': 'UserSessionId'},
    {
      '1': 'Reply',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.SocketMessage',
      '10': 'Reply'
    },
  ],
};

/// Descriptor for `Rpc_GatewaySendMsgToAgentReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rpc_GatewaySendMsgToAgentReqDescriptor =
    $convert.base64Decode(
        'ChxScGNfR2F0ZXdheVNlbmRNc2dUb0FnZW50UmVxEiQKDVVzZXJTZXNzaW9uSWQYASABKAlSDV'
        'VzZXJTZXNzaW9uSWQSJAoFUmVwbHkYAiADKAsyDi5Tb2NrZXRNZXNzYWdlUgVSZXBseQ==');

@$core.Deprecated('Use rpc_GatewaySendMsgToAgentRespDescriptor instead')
const Rpc_GatewaySendMsgToAgentResp$json = {
  '1': 'Rpc_GatewaySendMsgToAgentResp',
  '2': [
    {
      '1': 'ErrorData',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.ErrorData',
      '10': 'ErrorData'
    },
  ],
};

/// Descriptor for `Rpc_GatewaySendMsgToAgentResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rpc_GatewaySendMsgToAgentRespDescriptor =
    $convert.base64Decode(
        'Ch1ScGNfR2F0ZXdheVNlbmRNc2dUb0FnZW50UmVzcBIoCglFcnJvckRhdGEYASABKAsyCi5Fcn'
        'JvckRhdGFSCUVycm9yRGF0YQ==');

@$core.Deprecated('Use rpc_GatewaySendMsgsToAgentsReqDescriptor instead')
const Rpc_GatewaySendMsgsToAgentsReq$json = {
  '1': 'Rpc_GatewaySendMsgsToAgentsReq',
  '2': [
    {'1': 'UserSessionIds', '3': 1, '4': 3, '5': 9, '10': 'UserSessionIds'},
    {
      '1': 'Reply',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.SocketMessage',
      '10': 'Reply'
    },
  ],
};

/// Descriptor for `Rpc_GatewaySendMsgsToAgentsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rpc_GatewaySendMsgsToAgentsReqDescriptor =
    $convert.base64Decode(
        'Ch5ScGNfR2F0ZXdheVNlbmRNc2dzVG9BZ2VudHNSZXESJgoOVXNlclNlc3Npb25JZHMYASADKA'
        'lSDlVzZXJTZXNzaW9uSWRzEiQKBVJlcGx5GAIgAygLMg4uU29ja2V0TWVzc2FnZVIFUmVwbHk=');

@$core.Deprecated('Use rpc_GatewaySendMsgsToAgentsRespDescriptor instead')
const Rpc_GatewaySendMsgsToAgentsResp$json = {
  '1': 'Rpc_GatewaySendMsgsToAgentsResp',
  '2': [
    {
      '1': 'ErrorData',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.ErrorData',
      '10': 'ErrorData'
    },
  ],
};

/// Descriptor for `Rpc_GatewaySendMsgsToAgentsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rpc_GatewaySendMsgsToAgentsRespDescriptor =
    $convert.base64Decode(
        'Ch9ScGNfR2F0ZXdheVNlbmRNc2dzVG9BZ2VudHNSZXNwEigKCUVycm9yRGF0YRgBIAEoCzIKLk'
        'Vycm9yRGF0YVIJRXJyb3JEYXRh');

@$core.Deprecated('Use rpc_GatewaySendMsgsToAllAgentsReqDescriptor instead')
const Rpc_GatewaySendMsgsToAllAgentsReq$json = {
  '1': 'Rpc_GatewaySendMsgsToAllAgentsReq',
  '2': [
    {
      '1': 'Reply',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.SocketMessage',
      '10': 'Reply'
    },
  ],
};

/// Descriptor for `Rpc_GatewaySendMsgsToAllAgentsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rpc_GatewaySendMsgsToAllAgentsReqDescriptor =
    $convert.base64Decode(
        'CiFScGNfR2F0ZXdheVNlbmRNc2dzVG9BbGxBZ2VudHNSZXESJAoFUmVwbHkYAiADKAsyDi5Tb2'
        'NrZXRNZXNzYWdlUgVSZXBseQ==');

@$core.Deprecated('Use rpc_GatewaySendMsgsToAllAgentsRespDescriptor instead')
const Rpc_GatewaySendMsgsToAllAgentsResp$json = {
  '1': 'Rpc_GatewaySendMsgsToAllAgentsResp',
  '2': [
    {
      '1': 'ErrorData',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.ErrorData',
      '10': 'ErrorData'
    },
  ],
};

/// Descriptor for `Rpc_GatewaySendMsgsToAllAgentsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rpc_GatewaySendMsgsToAllAgentsRespDescriptor =
    $convert.base64Decode(
        'CiJScGNfR2F0ZXdheVNlbmRNc2dzVG9BbGxBZ2VudHNSZXNwEigKCUVycm9yRGF0YRgBIAEoCz'
        'IKLkVycm9yRGF0YVIJRXJyb3JEYXRh');

@$core.Deprecated('Use rpc_GatewayCloseAgentsReqDescriptor instead')
const Rpc_GatewayCloseAgentsReq$json = {
  '1': 'Rpc_GatewayCloseAgentsReq',
  '2': [
    {'1': 'UserSessionIds', '3': 1, '4': 3, '5': 9, '10': 'UserSessionIds'},
  ],
};

/// Descriptor for `Rpc_GatewayCloseAgentsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rpc_GatewayCloseAgentsReqDescriptor =
    $convert.base64Decode(
        'ChlScGNfR2F0ZXdheUNsb3NlQWdlbnRzUmVxEiYKDlVzZXJTZXNzaW9uSWRzGAEgAygJUg5Vc2'
        'VyU2Vzc2lvbklkcw==');

@$core.Deprecated('Use rpc_GatewayCloseAgentsRespDescriptor instead')
const Rpc_GatewayCloseAgentsResp$json = {
  '1': 'Rpc_GatewayCloseAgentsResp',
  '2': [
    {
      '1': 'ErrorData',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.ErrorData',
      '10': 'ErrorData'
    },
  ],
};

/// Descriptor for `Rpc_GatewayCloseAgentsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rpc_GatewayCloseAgentsRespDescriptor =
    $convert.base64Decode(
        'ChpScGNfR2F0ZXdheUNsb3NlQWdlbnRzUmVzcBIoCglFcnJvckRhdGEYASABKAsyCi5FcnJvck'
        'RhdGFSCUVycm9yRGF0YQ==');
