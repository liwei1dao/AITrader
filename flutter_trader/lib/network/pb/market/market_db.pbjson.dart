// This is a generated file - do not edit.
//
// Generated from market/market_db.proto.

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

@$core.Deprecated('Use dBMarketIndexRealTimeItemDescriptor instead')
const DBMarketIndexRealTimeItem$json = {
  '1': 'DBMarketIndexRealTimeItem',
  '2': [
    {'1': 'index', '3': 1, '4': 1, '5': 3, '10': 'index'},
    {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'last_price', '3': 4, '4': 1, '5': 1, '10': 'lastPrice'},
    {'1': 'change_pct', '3': 5, '4': 1, '5': 1, '10': 'changePct'},
    {'1': 'change_amt', '3': 6, '4': 1, '5': 1, '10': 'changeAmt'},
    {'1': 'volume', '3': 7, '4': 1, '5': 1, '10': 'volume'},
    {'1': 'amount', '3': 8, '4': 1, '5': 1, '10': 'amount'},
    {'1': 'amplitude', '3': 9, '4': 1, '5': 1, '10': 'amplitude'},
    {'1': 'high', '3': 10, '4': 1, '5': 1, '10': 'high'},
    {'1': 'low', '3': 11, '4': 1, '5': 1, '10': 'low'},
    {'1': 'open', '3': 12, '4': 1, '5': 1, '10': 'open'},
    {'1': 'prev_close', '3': 13, '4': 1, '5': 1, '10': 'prevClose'},
    {'1': 'volume_ratio', '3': 14, '4': 1, '5': 1, '10': 'volumeRatio'},
    {'1': 'turnover_rate', '3': 15, '4': 1, '5': 1, '10': 'turnoverRate'},
    {'1': 'pe_dynamic', '3': 16, '4': 1, '5': 1, '10': 'peDynamic'},
    {'1': 'pb_ratio', '3': 17, '4': 1, '5': 1, '10': 'pbRatio'},
    {'1': 'total_market_cap', '3': 18, '4': 1, '5': 1, '10': 'totalMarketCap'},
    {
      '1': 'circulating_market_cap',
      '3': 19,
      '4': 1,
      '5': 1,
      '10': 'circulatingMarketCap'
    },
    {'1': 'price_speed', '3': 20, '4': 1, '5': 1, '10': 'priceSpeed'},
    {'1': 'five_min_change', '3': 21, '4': 1, '5': 1, '10': 'fiveMinChange'},
    {
      '1': 'sixty_day_change_pct',
      '3': 22,
      '4': 1,
      '5': 1,
      '10': 'sixtyDayChangePct'
    },
    {'1': 'ytd_change_pct', '3': 23, '4': 1, '5': 1, '10': 'ytdChangePct'},
  ],
};

/// Descriptor for `DBMarketIndexRealTimeItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dBMarketIndexRealTimeItemDescriptor = $convert.base64Decode(
    'ChlEQk1hcmtldEluZGV4UmVhbFRpbWVJdGVtEhQKBWluZGV4GAEgASgDUgVpbmRleBISCgRjb2'
    'RlGAIgASgJUgRjb2RlEhIKBG5hbWUYAyABKAlSBG5hbWUSHQoKbGFzdF9wcmljZRgEIAEoAVIJ'
    'bGFzdFByaWNlEh0KCmNoYW5nZV9wY3QYBSABKAFSCWNoYW5nZVBjdBIdCgpjaGFuZ2VfYW10GA'
    'YgASgBUgljaGFuZ2VBbXQSFgoGdm9sdW1lGAcgASgBUgZ2b2x1bWUSFgoGYW1vdW50GAggASgB'
    'UgZhbW91bnQSHAoJYW1wbGl0dWRlGAkgASgBUglhbXBsaXR1ZGUSEgoEaGlnaBgKIAEoAVIEaG'
    'lnaBIQCgNsb3cYCyABKAFSA2xvdxISCgRvcGVuGAwgASgBUgRvcGVuEh0KCnByZXZfY2xvc2UY'
    'DSABKAFSCXByZXZDbG9zZRIhCgx2b2x1bWVfcmF0aW8YDiABKAFSC3ZvbHVtZVJhdGlvEiMKDX'
    'R1cm5vdmVyX3JhdGUYDyABKAFSDHR1cm5vdmVyUmF0ZRIdCgpwZV9keW5hbWljGBAgASgBUglw'
    'ZUR5bmFtaWMSGQoIcGJfcmF0aW8YESABKAFSB3BiUmF0aW8SKAoQdG90YWxfbWFya2V0X2NhcB'
    'gSIAEoAVIOdG90YWxNYXJrZXRDYXASNAoWY2lyY3VsYXRpbmdfbWFya2V0X2NhcBgTIAEoAVIU'
    'Y2lyY3VsYXRpbmdNYXJrZXRDYXASHwoLcHJpY2Vfc3BlZWQYFCABKAFSCnByaWNlU3BlZWQSJg'
    'oPZml2ZV9taW5fY2hhbmdlGBUgASgBUg1maXZlTWluQ2hhbmdlEi8KFHNpeHR5X2RheV9jaGFu'
    'Z2VfcGN0GBYgASgBUhFzaXh0eURheUNoYW5nZVBjdBIkCg55dGRfY2hhbmdlX3BjdBgXIAEoAV'
    'IMeXRkQ2hhbmdlUGN0');
