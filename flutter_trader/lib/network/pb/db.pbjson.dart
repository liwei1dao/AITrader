// This is a generated file - do not edit.
//
// Generated from db.proto.

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

@$core.Deprecated('Use dBUserDescriptor instead')
const DBUser$json = {
  '1': 'DBUser',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `DBUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dBUserDescriptor = $convert.base64Decode(
    'CgZEQlVzZXISDgoCaWQYASABKAlSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSGgoIcGFzc3dvcm'
    'QYAyABKAlSCHBhc3N3b3Jk');

@$core.Deprecated('Use dBUserStockDescriptor instead')
const DBUserStock$json = {
  '1': 'DBUserStock',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'stock_id', '3': 3, '4': 1, '5': 9, '10': 'stockId'},
    {'1': 'amount', '3': 4, '4': 1, '5': 3, '10': 'amount'},
    {'1': 'price', '3': 5, '4': 1, '5': 5, '10': 'price'},
  ],
};

/// Descriptor for `DBUserStock`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dBUserStockDescriptor = $convert.base64Decode(
    'CgtEQlVzZXJTdG9jaxIOCgJpZBgBIAEoBFICaWQSFwoHdXNlcl9pZBgCIAEoCVIGdXNlcklkEh'
    'kKCHN0b2NrX2lkGAMgASgJUgdzdG9ja0lkEhYKBmFtb3VudBgEIAEoA1IGYW1vdW50EhQKBXBy'
    'aWNlGAUgASgFUgVwcmljZQ==');
