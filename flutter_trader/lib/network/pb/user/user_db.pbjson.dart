// This is a generated file - do not edit.
//
// Generated from user/user_db.proto.

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

@$core.Deprecated('Use sginTyoeDescriptor instead')
const SginTyoe$json = {
  '1': 'SginTyoe',
  '2': [
    {'1': 'Mail', '2': 0},
    {'1': 'Phone', '2': 1},
    {'1': 'WXChat', '2': 2},
    {'1': 'Google', '2': 3},
    {'1': 'FaceBook', '2': 4},
    {'1': 'Apple', '2': 5},
    {'1': 'Account', '2': 6},
    {'1': 'Token', '2': 10},
  ],
};

/// Descriptor for `SginTyoe`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sginTyoeDescriptor = $convert.base64Decode(
    'CghTZ2luVHlvZRIICgRNYWlsEAASCQoFUGhvbmUQARIKCgZXWENoYXQQAhIKCgZHb29nbGUQAx'
    'IMCghGYWNlQm9vaxAEEgkKBUFwcGxlEAUSCwoHQWNjb3VudBAGEgkKBVRva2VuEAo=');

@$core.Deprecated('Use dBUserDescriptor instead')
const DBUser$json = {
  '1': 'DBUser',
  '2': [
    {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'mail', '3': 2, '4': 1, '5': 9, '10': 'mail'},
    {'1': 'phone', '3': 3, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'name', '3': 5, '4': 1, '5': 9, '10': 'name'},
    {'1': 'avatar', '3': 8, '4': 1, '5': 9, '10': 'avatar'},
    {'1': 'account', '3': 12, '4': 1, '5': 9, '10': 'account'},
    {'1': 'password', '3': 13, '4': 1, '5': 9, '10': 'password'},
    {'1': 'createtime', '3': 14, '4': 1, '5': 3, '10': 'createtime'},
    {'1': 'language', '3': 15, '4': 1, '5': 9, '10': 'language'},
    {'1': 'servicetag', '3': 16, '4': 1, '5': 9, '10': 'servicetag'},
    {'1': 'wxopenid', '3': 17, '4': 1, '5': 9, '10': 'wxopenid'},
    {'1': 'googleopenid', '3': 18, '4': 1, '5': 9, '10': 'googleopenid'},
    {'1': 'facebookopenid', '3': 19, '4': 1, '5': 9, '10': 'facebookopenid'},
    {'1': 'appleopenid', '3': 20, '4': 1, '5': 9, '10': 'appleopenid'},
    {'1': 'lastsgintime', '3': 21, '4': 1, '5': 3, '10': 'lastsgintime'},
  ],
};

/// Descriptor for `DBUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dBUserDescriptor = $convert.base64Decode(
    'CgZEQlVzZXISEAoDdWlkGAEgASgJUgN1aWQSEgoEbWFpbBgCIAEoCVIEbWFpbBIUCgVwaG9uZR'
    'gDIAEoCVIFcGhvbmUSEgoEbmFtZRgFIAEoCVIEbmFtZRIWCgZhdmF0YXIYCCABKAlSBmF2YXRh'
    'chIYCgdhY2NvdW50GAwgASgJUgdhY2NvdW50EhoKCHBhc3N3b3JkGA0gASgJUghwYXNzd29yZB'
    'IeCgpjcmVhdGV0aW1lGA4gASgDUgpjcmVhdGV0aW1lEhoKCGxhbmd1YWdlGA8gASgJUghsYW5n'
    'dWFnZRIeCgpzZXJ2aWNldGFnGBAgASgJUgpzZXJ2aWNldGFnEhoKCHd4b3BlbmlkGBEgASgJUg'
    'h3eG9wZW5pZBIiCgxnb29nbGVvcGVuaWQYEiABKAlSDGdvb2dsZW9wZW5pZBImCg5mYWNlYm9v'
    'a29wZW5pZBgTIAEoCVIOZmFjZWJvb2tvcGVuaWQSIAoLYXBwbGVvcGVuaWQYFCABKAlSC2FwcG'
    'xlb3BlbmlkEiIKDGxhc3RzZ2ludGltZRgVIAEoA1IMbGFzdHNnaW50aW1l');

@$core.Deprecated('Use dBUserStockDescriptor instead')
const DBUserStock$json = {
  '1': 'DBUserStock',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
    {'1': 'uid', '3': 2, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'stockid', '3': 3, '4': 1, '5': 9, '10': 'stockid'},
    {'1': 'amount', '3': 4, '4': 1, '5': 3, '10': 'amount'},
    {'1': 'costprice', '3': 5, '4': 1, '5': 5, '10': 'costprice'},
  ],
};

/// Descriptor for `DBUserStock`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dBUserStockDescriptor = $convert.base64Decode(
    'CgtEQlVzZXJTdG9jaxIOCgJpZBgBIAEoBFICaWQSEAoDdWlkGAIgASgJUgN1aWQSGAoHc3RvY2'
    'tpZBgDIAEoCVIHc3RvY2tpZBIWCgZhbW91bnQYBCABKANSBmFtb3VudBIcCgljb3N0cHJpY2UY'
    'BSABKAVSCWNvc3RwcmljZQ==');
