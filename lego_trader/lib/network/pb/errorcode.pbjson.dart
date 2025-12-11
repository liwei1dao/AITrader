// This is a generated file - do not edit.
//
// Generated from errorcode.proto.

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

@$core.Deprecated('Use errorCodeDescriptor instead')
const ErrorCode$json = {
  '1': 'ErrorCode',
  '2': [
    {'1': 'Success', '2': 0},
    {'1': 'GatewayException', '2': 1},
    {'1': 'NoFindService', '2': 10},
    {'1': 'NoFindServiceHandleFunc', '2': 11},
    {'1': 'RpcFuncExecutionError', '2': 12},
    {'1': 'CacheReadError', '2': 13},
    {'1': 'SqlExecutionError', '2': 14},
    {'1': 'ReqParameterError', '2': 15},
    {'1': 'SignError', '2': 16},
    {'1': 'InsufficientPermissions', '2': 17},
    {'1': 'NoLogin', '2': 18},
    {'1': 'UserSessionNobeing', '2': 19},
    {'1': 'StateInvalid', '2': 20},
    {'1': 'DBError', '2': 21},
    {'1': 'SystemError', '2': 22},
    {'1': 'DecodeError', '2': 23},
    {'1': 'TimestampTimeout', '2': 24},
    {'1': 'PbError', '2': 25},
    {'1': 'AgentUidEmpty', '2': 26},
    {'1': 'ConfigNoFound', '2': 27},
    {'1': 'DecryptError', '2': 28},
    {'1': 'ClientError', '2': 29},
    {'1': 'Exception', '2': 100},
    {'1': 'AgentBetExchangeError', '2': 101},
    {'1': 'GameInMaintenance', '2': 102},
    {'1': 'NoCanBet', '2': 103},
    {'1': 'NoFindRoom', '2': 104},
    {'1': 'AgentNofund', '2': 105},
    {'1': 'NetWorkError', '2': 106},
  ],
};

/// Descriptor for `ErrorCode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List errorCodeDescriptor = $convert.base64Decode(
    'CglFcnJvckNvZGUSCwoHU3VjY2VzcxAAEhQKEEdhdGV3YXlFeGNlcHRpb24QARIRCg1Ob0Zpbm'
    'RTZXJ2aWNlEAoSGwoXTm9GaW5kU2VydmljZUhhbmRsZUZ1bmMQCxIZChVScGNGdW5jRXhlY3V0'
    'aW9uRXJyb3IQDBISCg5DYWNoZVJlYWRFcnJvchANEhUKEVNxbEV4ZWN1dGlvbkVycm9yEA4SFQ'
    'oRUmVxUGFyYW1ldGVyRXJyb3IQDxINCglTaWduRXJyb3IQEBIbChdJbnN1ZmZpY2llbnRQZXJt'
    'aXNzaW9ucxAREgsKB05vTG9naW4QEhIWChJVc2VyU2Vzc2lvbk5vYmVpbmcQExIQCgxTdGF0ZU'
    'ludmFsaWQQFBILCgdEQkVycm9yEBUSDwoLU3lzdGVtRXJyb3IQFhIPCgtEZWNvZGVFcnJvchAX'
    'EhQKEFRpbWVzdGFtcFRpbWVvdXQQGBILCgdQYkVycm9yEBkSEQoNQWdlbnRVaWRFbXB0eRAaEh'
    'EKDUNvbmZpZ05vRm91bmQQGxIQCgxEZWNyeXB0RXJyb3IQHBIPCgtDbGllbnRFcnJvchAdEg0K'
    'CUV4Y2VwdGlvbhBkEhkKFUFnZW50QmV0RXhjaGFuZ2VFcnJvchBlEhUKEUdhbWVJbk1haW50ZW'
    '5hbmNlEGYSDAoITm9DYW5CZXQQZxIOCgpOb0ZpbmRSb29tEGgSDwoLQWdlbnROb2Z1bmQQaRIQ'
    'CgxOZXRXb3JrRXJyb3IQag==');
