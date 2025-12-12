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

@$core.Deprecated('Use userSginReqDescriptor instead')
const UserSginReq$json = {
  '1': 'UserSginReq',
  '2': [
    {'1': 'stype', '3': 1, '4': 1, '5': 14, '6': '.SginTyoe', '10': 'stype'},
    {'1': 'account', '3': 2, '4': 1, '5': 9, '10': 'account'},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
    {'1': 'mail', '3': 4, '4': 1, '5': 9, '10': 'mail'},
    {'1': 'phone', '3': 5, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'ttoken', '3': 6, '4': 1, '5': 9, '10': 'ttoken'},
    {'1': 'vcode', '3': 7, '4': 1, '5': 9, '10': 'vcode'},
    {'1': 'name', '3': 10, '4': 1, '5': 9, '10': 'name'},
    {'1': 'avatar', '3': 11, '4': 1, '5': 9, '10': 'avatar'},
    {'1': 'language', '3': 12, '4': 1, '5': 9, '10': 'language'},
  ],
};

/// Descriptor for `UserSginReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userSginReqDescriptor = $convert.base64Decode(
    'CgtVc2VyU2dpblJlcRIfCgVzdHlwZRgBIAEoDjIJLlNnaW5UeW9lUgVzdHlwZRIYCgdhY2NvdW'
    '50GAIgASgJUgdhY2NvdW50EhoKCHBhc3N3b3JkGAMgASgJUghwYXNzd29yZBISCgRtYWlsGAQg'
    'ASgJUgRtYWlsEhQKBXBob25lGAUgASgJUgVwaG9uZRIWCgZ0dG9rZW4YBiABKAlSBnR0b2tlbh'
    'IUCgV2Y29kZRgHIAEoCVIFdmNvZGUSEgoEbmFtZRgKIAEoCVIEbmFtZRIWCgZhdmF0YXIYCyAB'
    'KAlSBmF2YXRhchIaCghsYW5ndWFnZRgMIAEoCVIIbGFuZ3VhZ2U=');

@$core.Deprecated('Use userSginRespDescriptor instead')
const UserSginResp$json = {
  '1': 'UserSginResp',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    {'1': 'user', '3': 2, '4': 1, '5': 11, '6': '.DBUser', '10': 'user'},
  ],
};

/// Descriptor for `UserSginResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userSginRespDescriptor = $convert.base64Decode(
    'CgxVc2VyU2dpblJlc3ASFAoFdG9rZW4YASABKAlSBXRva2VuEhsKBHVzZXIYAiABKAsyBy5EQl'
    'VzZXJSBHVzZXI=');
