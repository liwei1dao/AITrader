// This is a generated file - do not edit.
//
// Generated from stock/stock_db.proto.

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

@$core.Deprecated('Use dBStockIdentityDescriptor instead')
const DBStockIdentity$json = {
  '1': 'DBStockIdentity',
  '2': [
    {'1': 'Id', '3': 1, '4': 1, '5': 9, '10': 'Id'},
    {'1': 'Symbol', '3': 2, '4': 1, '5': 9, '10': 'Symbol'},
    {'1': 'Market', '3': 3, '4': 1, '5': 9, '10': 'Market'},
    {'1': 'Exchange', '3': 4, '4': 1, '5': 9, '10': 'Exchange'},
    {'1': 'Name', '3': 5, '4': 1, '5': 9, '10': 'Name'},
    {'1': 'FullName', '3': 6, '4': 1, '5': 9, '10': 'FullName'},
    {'1': 'ISIN', '3': 7, '4': 1, '5': 9, '10': 'ISIN'},
    {'1': 'Industry', '3': 8, '4': 1, '5': 9, '10': 'Industry'},
    {'1': 'Sector', '3': 9, '4': 1, '5': 9, '10': 'Sector'},
    {'1': 'Area', '3': 10, '4': 1, '5': 9, '10': 'Area'},
    {'1': 'Currency', '3': 11, '4': 1, '5': 9, '10': 'Currency'},
    {'1': 'ListDate', '3': 12, '4': 1, '5': 9, '10': 'ListDate'},
    {'1': 'Status', '3': 13, '4': 1, '5': 9, '10': 'Status'},
    {'1': 'Aliases', '3': 14, '4': 3, '5': 9, '10': 'Aliases'},
    {'1': 'CreateAt', '3': 15, '4': 1, '5': 9, '10': 'CreateAt'},
    {'1': 'UpdateAt', '3': 16, '4': 1, '5': 9, '10': 'UpdateAt'},
  ],
};

/// Descriptor for `DBStockIdentity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dBStockIdentityDescriptor = $convert.base64Decode(
    'Cg9EQlN0b2NrSWRlbnRpdHkSDgoCSWQYASABKAlSAklkEhYKBlN5bWJvbBgCIAEoCVIGU3ltYm'
    '9sEhYKBk1hcmtldBgDIAEoCVIGTWFya2V0EhoKCEV4Y2hhbmdlGAQgASgJUghFeGNoYW5nZRIS'
    'CgROYW1lGAUgASgJUgROYW1lEhoKCEZ1bGxOYW1lGAYgASgJUghGdWxsTmFtZRISCgRJU0lOGA'
    'cgASgJUgRJU0lOEhoKCEluZHVzdHJ5GAggASgJUghJbmR1c3RyeRIWCgZTZWN0b3IYCSABKAlS'
    'BlNlY3RvchISCgRBcmVhGAogASgJUgRBcmVhEhoKCEN1cnJlbmN5GAsgASgJUghDdXJyZW5jeR'
    'IaCghMaXN0RGF0ZRgMIAEoCVIITGlzdERhdGUSFgoGU3RhdHVzGA0gASgJUgZTdGF0dXMSGAoH'
    'QWxpYXNlcxgOIAMoCVIHQWxpYXNlcxIaCghDcmVhdGVBdBgPIAEoCVIIQ3JlYXRlQXQSGgoIVX'
    'BkYXRlQXQYECABKAlSCFVwZGF0ZUF0');

@$core.Deprecated('Use dBStockBarDescriptor instead')
const DBStockBar$json = {
  '1': 'DBStockBar',
  '2': [
    {'1': 'Id', '3': 1, '4': 1, '5': 9, '10': 'Id'},
    {'1': 'Symbol', '3': 2, '4': 1, '5': 9, '10': 'Symbol'},
    {'1': 'Market', '3': 3, '4': 1, '5': 9, '10': 'Market'},
    {'1': 'Timeframe', '3': 4, '4': 1, '5': 9, '10': 'Timeframe'},
    {'1': 'Ts', '3': 5, '4': 1, '5': 9, '10': 'Ts'},
    {'1': 'Open', '3': 6, '4': 1, '5': 1, '10': 'Open'},
    {'1': 'High', '3': 7, '4': 1, '5': 1, '10': 'High'},
    {'1': 'Low', '3': 8, '4': 1, '5': 1, '10': 'Low'},
    {'1': 'Close', '3': 9, '4': 1, '5': 1, '10': 'Close'},
    {'1': 'Volume', '3': 10, '4': 1, '5': 3, '10': 'Volume'},
    {'1': 'Turnover', '3': 11, '4': 1, '5': 1, '10': 'Turnover'},
    {'1': 'AdjFactor', '3': 12, '4': 1, '5': 1, '10': 'AdjFactor'},
    {'1': 'Source', '3': 13, '4': 1, '5': 9, '10': 'Source'},
    {'1': 'CreateAt', '3': 14, '4': 1, '5': 9, '10': 'CreateAt'},
    {'1': 'UpdateAt', '3': 15, '4': 1, '5': 9, '10': 'UpdateAt'},
  ],
};

/// Descriptor for `DBStockBar`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dBStockBarDescriptor = $convert.base64Decode(
    'CgpEQlN0b2NrQmFyEg4KAklkGAEgASgJUgJJZBIWCgZTeW1ib2wYAiABKAlSBlN5bWJvbBIWCg'
    'ZNYXJrZXQYAyABKAlSBk1hcmtldBIcCglUaW1lZnJhbWUYBCABKAlSCVRpbWVmcmFtZRIOCgJU'
    'cxgFIAEoCVICVHMSEgoET3BlbhgGIAEoAVIET3BlbhISCgRIaWdoGAcgASgBUgRIaWdoEhAKA0'
    'xvdxgIIAEoAVIDTG93EhQKBUNsb3NlGAkgASgBUgVDbG9zZRIWCgZWb2x1bWUYCiABKANSBlZv'
    'bHVtZRIaCghUdXJub3ZlchgLIAEoAVIIVHVybm92ZXISHAoJQWRqRmFjdG9yGAwgASgBUglBZG'
    'pGYWN0b3ISFgoGU291cmNlGA0gASgJUgZTb3VyY2USGgoIQ3JlYXRlQXQYDiABKAlSCENyZWF0'
    'ZUF0EhoKCFVwZGF0ZUF0GA8gASgJUghVcGRhdGVBdA==');

@$core.Deprecated('Use dBFundamentalSnapshotDescriptor instead')
const DBFundamentalSnapshot$json = {
  '1': 'DBFundamentalSnapshot',
  '2': [
    {'1': 'Id', '3': 1, '4': 1, '5': 9, '10': 'Id'},
    {'1': 'Symbol', '3': 2, '4': 1, '5': 9, '10': 'Symbol'},
    {'1': 'Market', '3': 3, '4': 1, '5': 9, '10': 'Market'},
    {'1': 'Ts', '3': 4, '4': 1, '5': 9, '10': 'Ts'},
    {'1': 'Period', '3': 5, '4': 1, '5': 9, '10': 'Period'},
    {'1': 'FiscalYear', '3': 6, '4': 1, '5': 9, '10': 'FiscalYear'},
    {'1': 'FiscalQuarter', '3': 7, '4': 1, '5': 9, '10': 'FiscalQuarter'},
    {'1': 'Source', '3': 8, '4': 1, '5': 9, '10': 'Source'},
    {'1': 'Revenue', '3': 20, '4': 1, '5': 1, '10': 'Revenue'},
    {'1': 'OperatingIncome', '3': 21, '4': 1, '5': 1, '10': 'OperatingIncome'},
    {'1': 'NetProfit', '3': 22, '4': 1, '5': 1, '10': 'NetProfit'},
    {'1': 'EPS', '3': 23, '4': 1, '5': 1, '10': 'EPS'},
    {'1': 'ROE', '3': 24, '4': 1, '5': 1, '10': 'ROE'},
    {'1': 'ROA', '3': 25, '4': 1, '5': 1, '10': 'ROA'},
    {'1': 'GrossMargin', '3': 26, '4': 1, '5': 1, '10': 'GrossMargin'},
    {'1': 'OperatingMargin', '3': 27, '4': 1, '5': 1, '10': 'OperatingMargin'},
    {'1': 'NetMargin', '3': 28, '4': 1, '5': 1, '10': 'NetMargin'},
    {'1': 'PE', '3': 29, '4': 1, '5': 1, '10': 'PE'},
    {'1': 'PB', '3': 30, '4': 1, '5': 1, '10': 'PB'},
    {'1': 'PS', '3': 31, '4': 1, '5': 1, '10': 'PS'},
    {
      '1': 'DividendPerShare',
      '3': 32,
      '4': 1,
      '5': 1,
      '10': 'DividendPerShare'
    },
    {'1': 'DividendYield', '3': 33, '4': 1, '5': 1, '10': 'DividendYield'},
    {'1': 'FreeCashFlow', '3': 34, '4': 1, '5': 1, '10': 'FreeCashFlow'},
    {'1': 'DebtToEquity', '3': 35, '4': 1, '5': 1, '10': 'DebtToEquity'},
    {'1': 'CurrentRatio', '3': 36, '4': 1, '5': 1, '10': 'CurrentRatio'},
    {'1': 'QuickRatio', '3': 37, '4': 1, '5': 1, '10': 'QuickRatio'},
    {'1': 'TotalAssets', '3': 38, '4': 1, '5': 1, '10': 'TotalAssets'},
    {
      '1': 'TotalLiabilities',
      '3': 39,
      '4': 1,
      '5': 1,
      '10': 'TotalLiabilities'
    },
    {'1': 'Equity', '3': 40, '4': 1, '5': 1, '10': 'Equity'},
    {'1': 'RevenueYoY', '3': 41, '4': 1, '5': 1, '10': 'RevenueYoY'},
    {'1': 'NetProfitYoY', '3': 42, '4': 1, '5': 1, '10': 'NetProfitYoY'},
    {'1': 'EPSYoY', '3': 43, '4': 1, '5': 1, '10': 'EPSYoY'},
    {
      '1': 'Metrics',
      '3': 60,
      '4': 3,
      '5': 11,
      '6': '.DBFundamentalSnapshot.MetricsEntry',
      '10': 'Metrics'
    },
    {'1': 'CreateAt', '3': 61, '4': 1, '5': 9, '10': 'CreateAt'},
  ],
  '3': [DBFundamentalSnapshot_MetricsEntry$json],
};

@$core.Deprecated('Use dBFundamentalSnapshotDescriptor instead')
const DBFundamentalSnapshot_MetricsEntry$json = {
  '1': 'MetricsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 1, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `DBFundamentalSnapshot`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dBFundamentalSnapshotDescriptor = $convert.base64Decode(
    'ChVEQkZ1bmRhbWVudGFsU25hcHNob3QSDgoCSWQYASABKAlSAklkEhYKBlN5bWJvbBgCIAEoCV'
    'IGU3ltYm9sEhYKBk1hcmtldBgDIAEoCVIGTWFya2V0Eg4KAlRzGAQgASgJUgJUcxIWCgZQZXJp'
    'b2QYBSABKAlSBlBlcmlvZBIeCgpGaXNjYWxZZWFyGAYgASgJUgpGaXNjYWxZZWFyEiQKDUZpc2'
    'NhbFF1YXJ0ZXIYByABKAlSDUZpc2NhbFF1YXJ0ZXISFgoGU291cmNlGAggASgJUgZTb3VyY2US'
    'GAoHUmV2ZW51ZRgUIAEoAVIHUmV2ZW51ZRIoCg9PcGVyYXRpbmdJbmNvbWUYFSABKAFSD09wZX'
    'JhdGluZ0luY29tZRIcCglOZXRQcm9maXQYFiABKAFSCU5ldFByb2ZpdBIQCgNFUFMYFyABKAFS'
    'A0VQUxIQCgNST0UYGCABKAFSA1JPRRIQCgNST0EYGSABKAFSA1JPQRIgCgtHcm9zc01hcmdpbh'
    'gaIAEoAVILR3Jvc3NNYXJnaW4SKAoPT3BlcmF0aW5nTWFyZ2luGBsgASgBUg9PcGVyYXRpbmdN'
    'YXJnaW4SHAoJTmV0TWFyZ2luGBwgASgBUglOZXRNYXJnaW4SDgoCUEUYHSABKAFSAlBFEg4KAl'
    'BCGB4gASgBUgJQQhIOCgJQUxgfIAEoAVICUFMSKgoQRGl2aWRlbmRQZXJTaGFyZRggIAEoAVIQ'
    'RGl2aWRlbmRQZXJTaGFyZRIkCg1EaXZpZGVuZFlpZWxkGCEgASgBUg1EaXZpZGVuZFlpZWxkEi'
    'IKDEZyZWVDYXNoRmxvdxgiIAEoAVIMRnJlZUNhc2hGbG93EiIKDERlYnRUb0VxdWl0eRgjIAEo'
    'AVIMRGVidFRvRXF1aXR5EiIKDEN1cnJlbnRSYXRpbxgkIAEoAVIMQ3VycmVudFJhdGlvEh4KCl'
    'F1aWNrUmF0aW8YJSABKAFSClF1aWNrUmF0aW8SIAoLVG90YWxBc3NldHMYJiABKAFSC1RvdGFs'
    'QXNzZXRzEioKEFRvdGFsTGlhYmlsaXRpZXMYJyABKAFSEFRvdGFsTGlhYmlsaXRpZXMSFgoGRX'
    'F1aXR5GCggASgBUgZFcXVpdHkSHgoKUmV2ZW51ZVlvWRgpIAEoAVIKUmV2ZW51ZVlvWRIiCgxO'
    'ZXRQcm9maXRZb1kYKiABKAFSDE5ldFByb2ZpdFlvWRIWCgZFUFNZb1kYKyABKAFSBkVQU1lvWR'
    'I9CgdNZXRyaWNzGDwgAygLMiMuREJGdW5kYW1lbnRhbFNuYXBzaG90Lk1ldHJpY3NFbnRyeVIH'
    'TWV0cmljcxIaCghDcmVhdGVBdBg9IAEoCVIIQ3JlYXRlQXQaOgoMTWV0cmljc0VudHJ5EhAKA2'
    'tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgBUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use dBStockNewsDescriptor instead')
const DBStockNews$json = {
  '1': 'DBStockNews',
  '2': [
    {'1': 'Id', '3': 1, '4': 1, '5': 9, '10': 'Id'},
    {'1': 'Symbol', '3': 2, '4': 1, '5': 9, '10': 'Symbol'},
    {'1': 'Market', '3': 3, '4': 1, '5': 9, '10': 'Market'},
    {'1': 'Ts', '3': 4, '4': 1, '5': 9, '10': 'Ts'},
    {'1': 'Title', '3': 5, '4': 1, '5': 9, '10': 'Title'},
    {'1': 'Source', '3': 6, '4': 1, '5': 9, '10': 'Source'},
    {'1': 'CreateAt', '3': 7, '4': 1, '5': 9, '10': 'CreateAt'},
  ],
};

/// Descriptor for `DBStockNews`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dBStockNewsDescriptor = $convert.base64Decode(
    'CgtEQlN0b2NrTmV3cxIOCgJJZBgBIAEoCVICSWQSFgoGU3ltYm9sGAIgASgJUgZTeW1ib2wSFg'
    'oGTWFya2V0GAMgASgJUgZNYXJrZXQSDgoCVHMYBCABKAlSAlRzEhQKBVRpdGxlGAUgASgJUgVU'
    'aXRsZRIWCgZTb3VyY2UYBiABKAlSBlNvdXJjZRIaCghDcmVhdGVBdBgHIAEoCVIIQ3JlYXRlQX'
    'Q=');

@$core.Deprecated('Use dBStockReportDescriptor instead')
const DBStockReport$json = {
  '1': 'DBStockReport',
  '2': [
    {'1': 'Id', '3': 1, '4': 1, '5': 9, '10': 'Id'},
    {'1': 'Symbol', '3': 2, '4': 1, '5': 9, '10': 'Symbol'},
    {'1': 'Market', '3': 3, '4': 1, '5': 9, '10': 'Market'},
    {'1': 'Ts', '3': 4, '4': 1, '5': 9, '10': 'Ts'},
    {'1': 'Source', '3': 5, '4': 1, '5': 9, '10': 'Source'},
    {'1': 'CreateAt', '3': 6, '4': 1, '5': 9, '10': 'CreateAt'},
  ],
};

/// Descriptor for `DBStockReport`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dBStockReportDescriptor = $convert.base64Decode(
    'Cg1EQlN0b2NrUmVwb3J0Eg4KAklkGAEgASgJUgJJZBIWCgZTeW1ib2wYAiABKAlSBlN5bWJvbB'
    'IWCgZNYXJrZXQYAyABKAlSBk1hcmtldBIOCgJUcxgEIAEoCVICVHMSFgoGU291cmNlGAUgASgJ'
    'UgZTb3VyY2USGgoIQ3JlYXRlQXQYBiABKAlSCENyZWF0ZUF0');
