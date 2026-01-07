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

@$core.Deprecated('Use dBStockBasicInfoDescriptor instead')
const DBStockBasicInfo$json = {
  '1': 'DBStockBasicInfo',
  '2': [
    {'1': 'Id', '3': 1, '4': 1, '5': 9, '10': 'Id'},
    {'1': 'Market', '3': 2, '4': 1, '5': 9, '10': 'Market'},
    {'1': 'Exchange', '3': 3, '4': 1, '5': 9, '10': 'Exchange'},
    {'1': 'Name', '3': 4, '4': 1, '5': 9, '10': 'Name'},
    {'1': 'FullName', '3': 5, '4': 1, '5': 9, '10': 'FullName'},
    {'1': 'Industry', '3': 7, '4': 1, '5': 9, '10': 'Industry'},
    {'1': 'Sector', '3': 8, '4': 1, '5': 9, '10': 'Sector'},
    {'1': 'Area', '3': 10, '4': 1, '5': 9, '10': 'Area'},
    {'1': 'Currency', '3': 11, '4': 1, '5': 9, '10': 'Currency'},
    {'1': 'ListDate', '3': 12, '4': 1, '5': 9, '10': 'ListDate'},
  ],
};

/// Descriptor for `DBStockBasicInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dBStockBasicInfoDescriptor = $convert.base64Decode(
    'ChBEQlN0b2NrQmFzaWNJbmZvEg4KAklkGAEgASgJUgJJZBIWCgZNYXJrZXQYAiABKAlSBk1hcm'
    'tldBIaCghFeGNoYW5nZRgDIAEoCVIIRXhjaGFuZ2USEgoETmFtZRgEIAEoCVIETmFtZRIaCghG'
    'dWxsTmFtZRgFIAEoCVIIRnVsbE5hbWUSGgoISW5kdXN0cnkYByABKAlSCEluZHVzdHJ5EhYKBl'
    'NlY3RvchgIIAEoCVIGU2VjdG9yEhIKBEFyZWEYCiABKAlSBEFyZWESGgoIQ3VycmVuY3kYCyAB'
    'KAlSCEN1cnJlbmN5EhoKCExpc3REYXRlGAwgASgJUghMaXN0RGF0ZQ==');

@$core.Deprecated('Use dBStockOperatingSnapshotDescriptor instead')
const DBStockOperatingSnapshot$json = {
  '1': 'DBStockOperatingSnapshot',
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
    {'1': 'CreateAt', '3': 61, '4': 1, '5': 9, '10': 'CreateAt'},
  ],
};

/// Descriptor for `DBStockOperatingSnapshot`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dBStockOperatingSnapshotDescriptor = $convert.base64Decode(
    'ChhEQlN0b2NrT3BlcmF0aW5nU25hcHNob3QSDgoCSWQYASABKAlSAklkEhYKBlN5bWJvbBgCIA'
    'EoCVIGU3ltYm9sEhYKBk1hcmtldBgDIAEoCVIGTWFya2V0Eg4KAlRzGAQgASgJUgJUcxIWCgZQ'
    'ZXJpb2QYBSABKAlSBlBlcmlvZBIeCgpGaXNjYWxZZWFyGAYgASgJUgpGaXNjYWxZZWFyEiQKDU'
    'Zpc2NhbFF1YXJ0ZXIYByABKAlSDUZpc2NhbFF1YXJ0ZXISFgoGU291cmNlGAggASgJUgZTb3Vy'
    'Y2USGAoHUmV2ZW51ZRgUIAEoAVIHUmV2ZW51ZRIoCg9PcGVyYXRpbmdJbmNvbWUYFSABKAFSD0'
    '9wZXJhdGluZ0luY29tZRIcCglOZXRQcm9maXQYFiABKAFSCU5ldFByb2ZpdBIQCgNFUFMYFyAB'
    'KAFSA0VQUxIQCgNST0UYGCABKAFSA1JPRRIQCgNST0EYGSABKAFSA1JPQRIgCgtHcm9zc01hcm'
    'dpbhgaIAEoAVILR3Jvc3NNYXJnaW4SKAoPT3BlcmF0aW5nTWFyZ2luGBsgASgBUg9PcGVyYXRp'
    'bmdNYXJnaW4SHAoJTmV0TWFyZ2luGBwgASgBUglOZXRNYXJnaW4SDgoCUEUYHSABKAFSAlBFEg'
    '4KAlBCGB4gASgBUgJQQhIOCgJQUxgfIAEoAVICUFMSKgoQRGl2aWRlbmRQZXJTaGFyZRggIAEo'
    'AVIQRGl2aWRlbmRQZXJTaGFyZRIkCg1EaXZpZGVuZFlpZWxkGCEgASgBUg1EaXZpZGVuZFlpZW'
    'xkEiIKDEZyZWVDYXNoRmxvdxgiIAEoAVIMRnJlZUNhc2hGbG93EiIKDERlYnRUb0VxdWl0eRgj'
    'IAEoAVIMRGVidFRvRXF1aXR5EiIKDEN1cnJlbnRSYXRpbxgkIAEoAVIMQ3VycmVudFJhdGlvEh'
    '4KClF1aWNrUmF0aW8YJSABKAFSClF1aWNrUmF0aW8SIAoLVG90YWxBc3NldHMYJiABKAFSC1Rv'
    'dGFsQXNzZXRzEioKEFRvdGFsTGlhYmlsaXRpZXMYJyABKAFSEFRvdGFsTGlhYmlsaXRpZXMSFg'
    'oGRXF1aXR5GCggASgBUgZFcXVpdHkSHgoKUmV2ZW51ZVlvWRgpIAEoAVIKUmV2ZW51ZVlvWRIi'
    'CgxOZXRQcm9maXRZb1kYKiABKAFSDE5ldFByb2ZpdFlvWRIWCgZFUFNZb1kYKyABKAFSBkVQU1'
    'lvWRIaCghDcmVhdGVBdBg9IAEoCVIIQ3JlYXRlQXQ=');

@$core.Deprecated('Use dBStockRealTimeItemDescriptor instead')
const DBStockRealTimeItem$json = {
  '1': 'DBStockRealTimeItem',
  '2': [
    {'1': 'Code', '3': 1, '4': 1, '5': 9, '10': 'Code'},
    {'1': 'Name', '3': 2, '4': 1, '5': 9, '10': 'Name'},
    {'1': 'LastPrice', '3': 3, '4': 1, '5': 1, '10': 'LastPrice'},
    {'1': 'ChangePct', '3': 4, '4': 1, '5': 1, '10': 'ChangePct'},
    {'1': 'ChangeAmt', '3': 5, '4': 1, '5': 1, '10': 'ChangeAmt'},
    {'1': 'Volume', '3': 6, '4': 1, '5': 1, '10': 'Volume'},
    {'1': 'Amount', '3': 7, '4': 1, '5': 1, '10': 'Amount'},
    {'1': 'Amplitude', '3': 8, '4': 1, '5': 1, '10': 'Amplitude'},
    {'1': 'High', '3': 9, '4': 1, '5': 1, '10': 'High'},
    {'1': 'Low', '3': 10, '4': 1, '5': 1, '10': 'Low'},
    {'1': 'Open', '3': 11, '4': 1, '5': 1, '10': 'Open'},
    {'1': 'PrevClose', '3': 12, '4': 1, '5': 1, '10': 'PrevClose'},
    {'1': 'VolumeRatio', '3': 13, '4': 1, '5': 1, '10': 'VolumeRatio'},
    {'1': 'TurnoverRate', '3': 14, '4': 1, '5': 1, '10': 'TurnoverRate'},
    {'1': 'PeDynamic', '3': 15, '4': 1, '5': 1, '10': 'PeDynamic'},
    {'1': 'PbRatio', '3': 16, '4': 1, '5': 1, '10': 'PbRatio'},
    {'1': 'TotalMarketCap', '3': 17, '4': 1, '5': 1, '10': 'TotalMarketCap'},
    {
      '1': 'CirculatingMarketCap',
      '3': 18,
      '4': 1,
      '5': 1,
      '10': 'CirculatingMarketCap'
    },
    {'1': 'PriceSpeed', '3': 19, '4': 1, '5': 1, '10': 'PriceSpeed'},
    {'1': 'FiveMinChange', '3': 20, '4': 1, '5': 1, '10': 'FiveMinChange'},
    {
      '1': 'SixtyDayChangePct',
      '3': 21,
      '4': 1,
      '5': 1,
      '10': 'SixtyDayChangePct'
    },
    {'1': 'YtdChangePct', '3': 22, '4': 1, '5': 1, '10': 'YtdChangePct'},
  ],
};

/// Descriptor for `DBStockRealTimeItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dBStockRealTimeItemDescriptor = $convert.base64Decode(
    'ChNEQlN0b2NrUmVhbFRpbWVJdGVtEhIKBENvZGUYASABKAlSBENvZGUSEgoETmFtZRgCIAEoCV'
    'IETmFtZRIcCglMYXN0UHJpY2UYAyABKAFSCUxhc3RQcmljZRIcCglDaGFuZ2VQY3QYBCABKAFS'
    'CUNoYW5nZVBjdBIcCglDaGFuZ2VBbXQYBSABKAFSCUNoYW5nZUFtdBIWCgZWb2x1bWUYBiABKA'
    'FSBlZvbHVtZRIWCgZBbW91bnQYByABKAFSBkFtb3VudBIcCglBbXBsaXR1ZGUYCCABKAFSCUFt'
    'cGxpdHVkZRISCgRIaWdoGAkgASgBUgRIaWdoEhAKA0xvdxgKIAEoAVIDTG93EhIKBE9wZW4YCy'
    'ABKAFSBE9wZW4SHAoJUHJldkNsb3NlGAwgASgBUglQcmV2Q2xvc2USIAoLVm9sdW1lUmF0aW8Y'
    'DSABKAFSC1ZvbHVtZVJhdGlvEiIKDFR1cm5vdmVyUmF0ZRgOIAEoAVIMVHVybm92ZXJSYXRlEh'
    'wKCVBlRHluYW1pYxgPIAEoAVIJUGVEeW5hbWljEhgKB1BiUmF0aW8YECABKAFSB1BiUmF0aW8S'
    'JgoOVG90YWxNYXJrZXRDYXAYESABKAFSDlRvdGFsTWFya2V0Q2FwEjIKFENpcmN1bGF0aW5nTW'
    'Fya2V0Q2FwGBIgASgBUhRDaXJjdWxhdGluZ01hcmtldENhcBIeCgpQcmljZVNwZWVkGBMgASgB'
    'UgpQcmljZVNwZWVkEiQKDUZpdmVNaW5DaGFuZ2UYFCABKAFSDUZpdmVNaW5DaGFuZ2USLAoRU2'
    'l4dHlEYXlDaGFuZ2VQY3QYFSABKAFSEVNpeHR5RGF5Q2hhbmdlUGN0EiIKDFl0ZENoYW5nZVBj'
    'dBgWIAEoAVIMWXRkQ2hhbmdlUGN0');

@$core.Deprecated('Use dBStockBarDescriptor instead')
const DBStockBar$json = {
  '1': 'DBStockBar',
  '2': [
    {'1': 'Id', '3': 1, '4': 1, '5': 9, '10': 'Id'},
    {'1': 'Symbol', '3': 2, '4': 1, '5': 9, '10': 'Symbol'},
    {'1': 'Market', '3': 3, '4': 1, '5': 9, '10': 'Market'},
    {'1': 'Date', '3': 4, '4': 1, '5': 9, '10': 'Date'},
    {'1': 'Open', '3': 5, '4': 1, '5': 1, '10': 'Open'},
    {'1': 'Close', '3': 6, '4': 1, '5': 1, '10': 'Close'},
    {'1': 'High', '3': 7, '4': 1, '5': 1, '10': 'High'},
    {'1': 'Low', '3': 8, '4': 1, '5': 1, '10': 'Low'},
    {'1': 'Volume', '3': 9, '4': 1, '5': 1, '10': 'Volume'},
    {'1': 'Amount', '3': 10, '4': 1, '5': 1, '10': 'Amount'},
    {'1': 'Amplitude', '3': 11, '4': 1, '5': 1, '10': 'Amplitude'},
    {'1': 'ChangePct', '3': 12, '4': 1, '5': 1, '10': 'ChangePct'},
    {'1': 'ChangeAmt', '3': 13, '4': 1, '5': 1, '10': 'ChangeAmt'},
    {'1': 'TurnoverRate', '3': 14, '4': 1, '5': 1, '10': 'TurnoverRate'},
  ],
};

/// Descriptor for `DBStockBar`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dBStockBarDescriptor = $convert.base64Decode(
    'CgpEQlN0b2NrQmFyEg4KAklkGAEgASgJUgJJZBIWCgZTeW1ib2wYAiABKAlSBlN5bWJvbBIWCg'
    'ZNYXJrZXQYAyABKAlSBk1hcmtldBISCgREYXRlGAQgASgJUgREYXRlEhIKBE9wZW4YBSABKAFS'
    'BE9wZW4SFAoFQ2xvc2UYBiABKAFSBUNsb3NlEhIKBEhpZ2gYByABKAFSBEhpZ2gSEAoDTG93GA'
    'ggASgBUgNMb3cSFgoGVm9sdW1lGAkgASgBUgZWb2x1bWUSFgoGQW1vdW50GAogASgBUgZBbW91'
    'bnQSHAoJQW1wbGl0dWRlGAsgASgBUglBbXBsaXR1ZGUSHAoJQ2hhbmdlUGN0GAwgASgBUglDaG'
    'FuZ2VQY3QSHAoJQ2hhbmdlQW10GA0gASgBUglDaGFuZ2VBbXQSIgoMVHVybm92ZXJSYXRlGA4g'
    'ASgBUgxUdXJub3ZlclJhdGU=');

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
    {'1': 'Url', '3': 7, '4': 1, '5': 9, '10': 'Url'},
    {'1': 'CreateAt', '3': 8, '4': 1, '5': 9, '10': 'CreateAt'},
  ],
};

/// Descriptor for `DBStockNews`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dBStockNewsDescriptor = $convert.base64Decode(
    'CgtEQlN0b2NrTmV3cxIOCgJJZBgBIAEoCVICSWQSFgoGU3ltYm9sGAIgASgJUgZTeW1ib2wSFg'
    'oGTWFya2V0GAMgASgJUgZNYXJrZXQSDgoCVHMYBCABKAlSAlRzEhQKBVRpdGxlGAUgASgJUgVU'
    'aXRsZRIWCgZTb3VyY2UYBiABKAlSBlNvdXJjZRIQCgNVcmwYByABKAlSA1VybBIaCghDcmVhdG'
    'VBdBgIIAEoCVIIQ3JlYXRlQXQ=');

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
