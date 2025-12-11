// This is a generated file - do not edit.
//
// Generated from user/user_msg.proto.

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

@$core.Deprecated('Use userSignInReqDescriptor instead')
const UserSignInReq$json = {
  '1': 'UserSignInReq',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `UserSignInReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userSignInReqDescriptor = $convert.base64Decode(
    'Cg1Vc2VyU2lnbkluUmVxEhIKBG5hbWUYASABKAlSBG5hbWUSGgoIcGFzc3dvcmQYAiABKAlSCH'
    'Bhc3N3b3Jk');

@$core.Deprecated('Use userSignInRespDescriptor instead')
const UserSignInResp$json = {
  '1': 'UserSignInResp',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `UserSignInResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userSignInRespDescriptor = $convert
    .base64Decode('Cg5Vc2VyU2lnbkluUmVzcBIUCgV0b2tlbhgBIAEoCVIFdG9rZW4=');
