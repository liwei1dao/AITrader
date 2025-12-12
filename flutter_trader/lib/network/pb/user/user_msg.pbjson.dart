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
    {'1': 'mail', '3': 2, '4': 1, '5': 9, '10': 'mail'},
    {'1': 'phone', '3': 3, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'ttoken', '3': 4, '4': 1, '5': 9, '10': 'ttoken'},
    {'1': 'vcode', '3': 5, '4': 1, '5': 9, '10': 'vcode'},
    {'1': 'name', '3': 20, '4': 1, '5': 9, '10': 'name'},
    {'1': 'avatar', '3': 21, '4': 1, '5': 9, '10': 'avatar'},
    {'1': 'language', '3': 22, '4': 1, '5': 9, '10': 'language'},
  ],
};

/// Descriptor for `UserSginReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userSginReqDescriptor = $convert.base64Decode(
    'CgtVc2VyU2dpblJlcRIfCgVzdHlwZRgBIAEoDjIJLlNnaW5UeW9lUgVzdHlwZRISCgRtYWlsGA'
    'IgASgJUgRtYWlsEhQKBXBob25lGAMgASgJUgVwaG9uZRIWCgZ0dG9rZW4YBCABKAlSBnR0b2tl'
    'bhIUCgV2Y29kZRgFIAEoCVIFdmNvZGUSEgoEbmFtZRgUIAEoCVIEbmFtZRIWCgZhdmF0YXIYFS'
    'ABKAlSBmF2YXRhchIaCghsYW5ndWFnZRgWIAEoCVIIbGFuZ3VhZ2U=');

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
