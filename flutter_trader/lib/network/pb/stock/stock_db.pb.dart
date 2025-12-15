// This is a generated file - do not edit.
//
// Generated from stock/stock_db.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// 股票基础信息（静态/半静态）
class DBStockIdentity extends $pb.GeneratedMessage {
  factory DBStockIdentity({
    $core.String? id,
    $core.String? market,
    $core.String? exchange,
    $core.String? name,
    $core.String? fullName,
    $core.String? industry,
    $core.String? sector,
    $core.String? area,
    $core.String? currency,
    $core.String? listDate,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (market != null) result.market = market;
    if (exchange != null) result.exchange = exchange;
    if (name != null) result.name = name;
    if (fullName != null) result.fullName = fullName;
    if (industry != null) result.industry = industry;
    if (sector != null) result.sector = sector;
    if (area != null) result.area = area;
    if (currency != null) result.currency = currency;
    if (listDate != null) result.listDate = listDate;
    return result;
  }

  DBStockIdentity._();

  factory DBStockIdentity.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DBStockIdentity.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DBStockIdentity',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Id', protoName: 'Id')
    ..aOS(2, _omitFieldNames ? '' : 'Market', protoName: 'Market')
    ..aOS(3, _omitFieldNames ? '' : 'Exchange', protoName: 'Exchange')
    ..aOS(4, _omitFieldNames ? '' : 'Name', protoName: 'Name')
    ..aOS(5, _omitFieldNames ? '' : 'FullName', protoName: 'FullName')
    ..aOS(7, _omitFieldNames ? '' : 'Industry', protoName: 'Industry')
    ..aOS(8, _omitFieldNames ? '' : 'Sector', protoName: 'Sector')
    ..aOS(10, _omitFieldNames ? '' : 'Area', protoName: 'Area')
    ..aOS(11, _omitFieldNames ? '' : 'Currency', protoName: 'Currency')
    ..aOS(12, _omitFieldNames ? '' : 'ListDate', protoName: 'ListDate')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DBStockIdentity clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DBStockIdentity copyWith(void Function(DBStockIdentity) updates) =>
      super.copyWith((message) => updates(message as DBStockIdentity))
          as DBStockIdentity;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DBStockIdentity create() => DBStockIdentity._();
  @$core.override
  DBStockIdentity createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DBStockIdentity getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DBStockIdentity>(create);
  static DBStockIdentity? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get market => $_getSZ(1);
  @$pb.TagNumber(2)
  set market($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMarket() => $_has(1);
  @$pb.TagNumber(2)
  void clearMarket() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get exchange => $_getSZ(2);
  @$pb.TagNumber(3)
  set exchange($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExchange() => $_has(2);
  @$pb.TagNumber(3)
  void clearExchange() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get fullName => $_getSZ(4);
  @$pb.TagNumber(5)
  set fullName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFullName() => $_has(4);
  @$pb.TagNumber(5)
  void clearFullName() => $_clearField(5);

  @$pb.TagNumber(7)
  $core.String get industry => $_getSZ(5);
  @$pb.TagNumber(7)
  set industry($core.String value) => $_setString(5, value);
  @$pb.TagNumber(7)
  $core.bool hasIndustry() => $_has(5);
  @$pb.TagNumber(7)
  void clearIndustry() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get sector => $_getSZ(6);
  @$pb.TagNumber(8)
  set sector($core.String value) => $_setString(6, value);
  @$pb.TagNumber(8)
  $core.bool hasSector() => $_has(6);
  @$pb.TagNumber(8)
  void clearSector() => $_clearField(8);

  @$pb.TagNumber(10)
  $core.String get area => $_getSZ(7);
  @$pb.TagNumber(10)
  set area($core.String value) => $_setString(7, value);
  @$pb.TagNumber(10)
  $core.bool hasArea() => $_has(7);
  @$pb.TagNumber(10)
  void clearArea() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get currency => $_getSZ(8);
  @$pb.TagNumber(11)
  set currency($core.String value) => $_setString(8, value);
  @$pb.TagNumber(11)
  $core.bool hasCurrency() => $_has(8);
  @$pb.TagNumber(11)
  void clearCurrency() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get listDate => $_getSZ(9);
  @$pb.TagNumber(12)
  set listDate($core.String value) => $_setString(9, value);
  @$pb.TagNumber(12)
  $core.bool hasListDate() => $_has(9);
  @$pb.TagNumber(12)
  void clearListDate() => $_clearField(12);
}

/// 基本面快照（按期/按时间）
class DBFundamentalSnapshot extends $pb.GeneratedMessage {
  factory DBFundamentalSnapshot({
    $core.String? id,
    $core.String? symbol,
    $core.String? market,
    $core.String? ts,
    $core.String? period,
    $core.String? fiscalYear,
    $core.String? fiscalQuarter,
    $core.String? source,
    $core.double? revenue,
    $core.double? operatingIncome,
    $core.double? netProfit,
    $core.double? ePS,
    $core.double? rOE,
    $core.double? rOA,
    $core.double? grossMargin,
    $core.double? operatingMargin,
    $core.double? netMargin,
    $core.double? pE,
    $core.double? pB,
    $core.double? pS,
    $core.double? dividendPerShare,
    $core.double? dividendYield,
    $core.double? freeCashFlow,
    $core.double? debtToEquity,
    $core.double? currentRatio,
    $core.double? quickRatio,
    $core.double? totalAssets,
    $core.double? totalLiabilities,
    $core.double? equity,
    $core.double? revenueYoY,
    $core.double? netProfitYoY,
    $core.double? ePSYoY,
    $core.Iterable<$core.MapEntry<$core.String, $core.double>>? metrics,
    $core.String? createAt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (symbol != null) result.symbol = symbol;
    if (market != null) result.market = market;
    if (ts != null) result.ts = ts;
    if (period != null) result.period = period;
    if (fiscalYear != null) result.fiscalYear = fiscalYear;
    if (fiscalQuarter != null) result.fiscalQuarter = fiscalQuarter;
    if (source != null) result.source = source;
    if (revenue != null) result.revenue = revenue;
    if (operatingIncome != null) result.operatingIncome = operatingIncome;
    if (netProfit != null) result.netProfit = netProfit;
    if (ePS != null) result.ePS = ePS;
    if (rOE != null) result.rOE = rOE;
    if (rOA != null) result.rOA = rOA;
    if (grossMargin != null) result.grossMargin = grossMargin;
    if (operatingMargin != null) result.operatingMargin = operatingMargin;
    if (netMargin != null) result.netMargin = netMargin;
    if (pE != null) result.pE = pE;
    if (pB != null) result.pB = pB;
    if (pS != null) result.pS = pS;
    if (dividendPerShare != null) result.dividendPerShare = dividendPerShare;
    if (dividendYield != null) result.dividendYield = dividendYield;
    if (freeCashFlow != null) result.freeCashFlow = freeCashFlow;
    if (debtToEquity != null) result.debtToEquity = debtToEquity;
    if (currentRatio != null) result.currentRatio = currentRatio;
    if (quickRatio != null) result.quickRatio = quickRatio;
    if (totalAssets != null) result.totalAssets = totalAssets;
    if (totalLiabilities != null) result.totalLiabilities = totalLiabilities;
    if (equity != null) result.equity = equity;
    if (revenueYoY != null) result.revenueYoY = revenueYoY;
    if (netProfitYoY != null) result.netProfitYoY = netProfitYoY;
    if (ePSYoY != null) result.ePSYoY = ePSYoY;
    if (metrics != null) result.metrics.addEntries(metrics);
    if (createAt != null) result.createAt = createAt;
    return result;
  }

  DBFundamentalSnapshot._();

  factory DBFundamentalSnapshot.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DBFundamentalSnapshot.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DBFundamentalSnapshot',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Id', protoName: 'Id')
    ..aOS(2, _omitFieldNames ? '' : 'Symbol', protoName: 'Symbol')
    ..aOS(3, _omitFieldNames ? '' : 'Market', protoName: 'Market')
    ..aOS(4, _omitFieldNames ? '' : 'Ts', protoName: 'Ts')
    ..aOS(5, _omitFieldNames ? '' : 'Period', protoName: 'Period')
    ..aOS(6, _omitFieldNames ? '' : 'FiscalYear', protoName: 'FiscalYear')
    ..aOS(7, _omitFieldNames ? '' : 'FiscalQuarter', protoName: 'FiscalQuarter')
    ..aOS(8, _omitFieldNames ? '' : 'Source', protoName: 'Source')
    ..aD(20, _omitFieldNames ? '' : 'Revenue', protoName: 'Revenue')
    ..aD(21, _omitFieldNames ? '' : 'OperatingIncome',
        protoName: 'OperatingIncome')
    ..aD(22, _omitFieldNames ? '' : 'NetProfit', protoName: 'NetProfit')
    ..aD(23, _omitFieldNames ? '' : 'EPS', protoName: 'EPS')
    ..aD(24, _omitFieldNames ? '' : 'ROE', protoName: 'ROE')
    ..aD(25, _omitFieldNames ? '' : 'ROA', protoName: 'ROA')
    ..aD(26, _omitFieldNames ? '' : 'GrossMargin', protoName: 'GrossMargin')
    ..aD(27, _omitFieldNames ? '' : 'OperatingMargin',
        protoName: 'OperatingMargin')
    ..aD(28, _omitFieldNames ? '' : 'NetMargin', protoName: 'NetMargin')
    ..aD(29, _omitFieldNames ? '' : 'PE', protoName: 'PE')
    ..aD(30, _omitFieldNames ? '' : 'PB', protoName: 'PB')
    ..aD(31, _omitFieldNames ? '' : 'PS', protoName: 'PS')
    ..aD(32, _omitFieldNames ? '' : 'DividendPerShare',
        protoName: 'DividendPerShare')
    ..aD(33, _omitFieldNames ? '' : 'DividendYield', protoName: 'DividendYield')
    ..aD(34, _omitFieldNames ? '' : 'FreeCashFlow', protoName: 'FreeCashFlow')
    ..aD(35, _omitFieldNames ? '' : 'DebtToEquity', protoName: 'DebtToEquity')
    ..aD(36, _omitFieldNames ? '' : 'CurrentRatio', protoName: 'CurrentRatio')
    ..aD(37, _omitFieldNames ? '' : 'QuickRatio', protoName: 'QuickRatio')
    ..aD(38, _omitFieldNames ? '' : 'TotalAssets', protoName: 'TotalAssets')
    ..aD(39, _omitFieldNames ? '' : 'TotalLiabilities',
        protoName: 'TotalLiabilities')
    ..aD(40, _omitFieldNames ? '' : 'Equity', protoName: 'Equity')
    ..aD(41, _omitFieldNames ? '' : 'RevenueYoY', protoName: 'RevenueYoY')
    ..aD(42, _omitFieldNames ? '' : 'NetProfitYoY', protoName: 'NetProfitYoY')
    ..aD(43, _omitFieldNames ? '' : 'EPSYoY', protoName: 'EPSYoY')
    ..m<$core.String, $core.double>(60, _omitFieldNames ? '' : 'Metrics',
        protoName: 'Metrics',
        entryClassName: 'DBFundamentalSnapshot.MetricsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OD)
    ..aOS(61, _omitFieldNames ? '' : 'CreateAt', protoName: 'CreateAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DBFundamentalSnapshot clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DBFundamentalSnapshot copyWith(
          void Function(DBFundamentalSnapshot) updates) =>
      super.copyWith((message) => updates(message as DBFundamentalSnapshot))
          as DBFundamentalSnapshot;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DBFundamentalSnapshot create() => DBFundamentalSnapshot._();
  @$core.override
  DBFundamentalSnapshot createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DBFundamentalSnapshot getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DBFundamentalSnapshot>(create);
  static DBFundamentalSnapshot? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get symbol => $_getSZ(1);
  @$pb.TagNumber(2)
  set symbol($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSymbol() => $_has(1);
  @$pb.TagNumber(2)
  void clearSymbol() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get market => $_getSZ(2);
  @$pb.TagNumber(3)
  set market($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMarket() => $_has(2);
  @$pb.TagNumber(3)
  void clearMarket() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get ts => $_getSZ(3);
  @$pb.TagNumber(4)
  set ts($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTs() => $_has(3);
  @$pb.TagNumber(4)
  void clearTs() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get period => $_getSZ(4);
  @$pb.TagNumber(5)
  set period($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPeriod() => $_has(4);
  @$pb.TagNumber(5)
  void clearPeriod() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get fiscalYear => $_getSZ(5);
  @$pb.TagNumber(6)
  set fiscalYear($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasFiscalYear() => $_has(5);
  @$pb.TagNumber(6)
  void clearFiscalYear() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get fiscalQuarter => $_getSZ(6);
  @$pb.TagNumber(7)
  set fiscalQuarter($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasFiscalQuarter() => $_has(6);
  @$pb.TagNumber(7)
  void clearFiscalQuarter() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get source => $_getSZ(7);
  @$pb.TagNumber(8)
  set source($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasSource() => $_has(7);
  @$pb.TagNumber(8)
  void clearSource() => $_clearField(8);

  @$pb.TagNumber(20)
  $core.double get revenue => $_getN(8);
  @$pb.TagNumber(20)
  set revenue($core.double value) => $_setDouble(8, value);
  @$pb.TagNumber(20)
  $core.bool hasRevenue() => $_has(8);
  @$pb.TagNumber(20)
  void clearRevenue() => $_clearField(20);

  @$pb.TagNumber(21)
  $core.double get operatingIncome => $_getN(9);
  @$pb.TagNumber(21)
  set operatingIncome($core.double value) => $_setDouble(9, value);
  @$pb.TagNumber(21)
  $core.bool hasOperatingIncome() => $_has(9);
  @$pb.TagNumber(21)
  void clearOperatingIncome() => $_clearField(21);

  @$pb.TagNumber(22)
  $core.double get netProfit => $_getN(10);
  @$pb.TagNumber(22)
  set netProfit($core.double value) => $_setDouble(10, value);
  @$pb.TagNumber(22)
  $core.bool hasNetProfit() => $_has(10);
  @$pb.TagNumber(22)
  void clearNetProfit() => $_clearField(22);

  @$pb.TagNumber(23)
  $core.double get ePS => $_getN(11);
  @$pb.TagNumber(23)
  set ePS($core.double value) => $_setDouble(11, value);
  @$pb.TagNumber(23)
  $core.bool hasEPS() => $_has(11);
  @$pb.TagNumber(23)
  void clearEPS() => $_clearField(23);

  @$pb.TagNumber(24)
  $core.double get rOE => $_getN(12);
  @$pb.TagNumber(24)
  set rOE($core.double value) => $_setDouble(12, value);
  @$pb.TagNumber(24)
  $core.bool hasROE() => $_has(12);
  @$pb.TagNumber(24)
  void clearROE() => $_clearField(24);

  @$pb.TagNumber(25)
  $core.double get rOA => $_getN(13);
  @$pb.TagNumber(25)
  set rOA($core.double value) => $_setDouble(13, value);
  @$pb.TagNumber(25)
  $core.bool hasROA() => $_has(13);
  @$pb.TagNumber(25)
  void clearROA() => $_clearField(25);

  @$pb.TagNumber(26)
  $core.double get grossMargin => $_getN(14);
  @$pb.TagNumber(26)
  set grossMargin($core.double value) => $_setDouble(14, value);
  @$pb.TagNumber(26)
  $core.bool hasGrossMargin() => $_has(14);
  @$pb.TagNumber(26)
  void clearGrossMargin() => $_clearField(26);

  @$pb.TagNumber(27)
  $core.double get operatingMargin => $_getN(15);
  @$pb.TagNumber(27)
  set operatingMargin($core.double value) => $_setDouble(15, value);
  @$pb.TagNumber(27)
  $core.bool hasOperatingMargin() => $_has(15);
  @$pb.TagNumber(27)
  void clearOperatingMargin() => $_clearField(27);

  @$pb.TagNumber(28)
  $core.double get netMargin => $_getN(16);
  @$pb.TagNumber(28)
  set netMargin($core.double value) => $_setDouble(16, value);
  @$pb.TagNumber(28)
  $core.bool hasNetMargin() => $_has(16);
  @$pb.TagNumber(28)
  void clearNetMargin() => $_clearField(28);

  @$pb.TagNumber(29)
  $core.double get pE => $_getN(17);
  @$pb.TagNumber(29)
  set pE($core.double value) => $_setDouble(17, value);
  @$pb.TagNumber(29)
  $core.bool hasPE() => $_has(17);
  @$pb.TagNumber(29)
  void clearPE() => $_clearField(29);

  @$pb.TagNumber(30)
  $core.double get pB => $_getN(18);
  @$pb.TagNumber(30)
  set pB($core.double value) => $_setDouble(18, value);
  @$pb.TagNumber(30)
  $core.bool hasPB() => $_has(18);
  @$pb.TagNumber(30)
  void clearPB() => $_clearField(30);

  @$pb.TagNumber(31)
  $core.double get pS => $_getN(19);
  @$pb.TagNumber(31)
  set pS($core.double value) => $_setDouble(19, value);
  @$pb.TagNumber(31)
  $core.bool hasPS() => $_has(19);
  @$pb.TagNumber(31)
  void clearPS() => $_clearField(31);

  @$pb.TagNumber(32)
  $core.double get dividendPerShare => $_getN(20);
  @$pb.TagNumber(32)
  set dividendPerShare($core.double value) => $_setDouble(20, value);
  @$pb.TagNumber(32)
  $core.bool hasDividendPerShare() => $_has(20);
  @$pb.TagNumber(32)
  void clearDividendPerShare() => $_clearField(32);

  @$pb.TagNumber(33)
  $core.double get dividendYield => $_getN(21);
  @$pb.TagNumber(33)
  set dividendYield($core.double value) => $_setDouble(21, value);
  @$pb.TagNumber(33)
  $core.bool hasDividendYield() => $_has(21);
  @$pb.TagNumber(33)
  void clearDividendYield() => $_clearField(33);

  @$pb.TagNumber(34)
  $core.double get freeCashFlow => $_getN(22);
  @$pb.TagNumber(34)
  set freeCashFlow($core.double value) => $_setDouble(22, value);
  @$pb.TagNumber(34)
  $core.bool hasFreeCashFlow() => $_has(22);
  @$pb.TagNumber(34)
  void clearFreeCashFlow() => $_clearField(34);

  @$pb.TagNumber(35)
  $core.double get debtToEquity => $_getN(23);
  @$pb.TagNumber(35)
  set debtToEquity($core.double value) => $_setDouble(23, value);
  @$pb.TagNumber(35)
  $core.bool hasDebtToEquity() => $_has(23);
  @$pb.TagNumber(35)
  void clearDebtToEquity() => $_clearField(35);

  @$pb.TagNumber(36)
  $core.double get currentRatio => $_getN(24);
  @$pb.TagNumber(36)
  set currentRatio($core.double value) => $_setDouble(24, value);
  @$pb.TagNumber(36)
  $core.bool hasCurrentRatio() => $_has(24);
  @$pb.TagNumber(36)
  void clearCurrentRatio() => $_clearField(36);

  @$pb.TagNumber(37)
  $core.double get quickRatio => $_getN(25);
  @$pb.TagNumber(37)
  set quickRatio($core.double value) => $_setDouble(25, value);
  @$pb.TagNumber(37)
  $core.bool hasQuickRatio() => $_has(25);
  @$pb.TagNumber(37)
  void clearQuickRatio() => $_clearField(37);

  @$pb.TagNumber(38)
  $core.double get totalAssets => $_getN(26);
  @$pb.TagNumber(38)
  set totalAssets($core.double value) => $_setDouble(26, value);
  @$pb.TagNumber(38)
  $core.bool hasTotalAssets() => $_has(26);
  @$pb.TagNumber(38)
  void clearTotalAssets() => $_clearField(38);

  @$pb.TagNumber(39)
  $core.double get totalLiabilities => $_getN(27);
  @$pb.TagNumber(39)
  set totalLiabilities($core.double value) => $_setDouble(27, value);
  @$pb.TagNumber(39)
  $core.bool hasTotalLiabilities() => $_has(27);
  @$pb.TagNumber(39)
  void clearTotalLiabilities() => $_clearField(39);

  @$pb.TagNumber(40)
  $core.double get equity => $_getN(28);
  @$pb.TagNumber(40)
  set equity($core.double value) => $_setDouble(28, value);
  @$pb.TagNumber(40)
  $core.bool hasEquity() => $_has(28);
  @$pb.TagNumber(40)
  void clearEquity() => $_clearField(40);

  @$pb.TagNumber(41)
  $core.double get revenueYoY => $_getN(29);
  @$pb.TagNumber(41)
  set revenueYoY($core.double value) => $_setDouble(29, value);
  @$pb.TagNumber(41)
  $core.bool hasRevenueYoY() => $_has(29);
  @$pb.TagNumber(41)
  void clearRevenueYoY() => $_clearField(41);

  @$pb.TagNumber(42)
  $core.double get netProfitYoY => $_getN(30);
  @$pb.TagNumber(42)
  set netProfitYoY($core.double value) => $_setDouble(30, value);
  @$pb.TagNumber(42)
  $core.bool hasNetProfitYoY() => $_has(30);
  @$pb.TagNumber(42)
  void clearNetProfitYoY() => $_clearField(42);

  @$pb.TagNumber(43)
  $core.double get ePSYoY => $_getN(31);
  @$pb.TagNumber(43)
  set ePSYoY($core.double value) => $_setDouble(31, value);
  @$pb.TagNumber(43)
  $core.bool hasEPSYoY() => $_has(31);
  @$pb.TagNumber(43)
  void clearEPSYoY() => $_clearField(43);

  @$pb.TagNumber(60)
  $pb.PbMap<$core.String, $core.double> get metrics => $_getMap(32);

  @$pb.TagNumber(61)
  $core.String get createAt => $_getSZ(33);
  @$pb.TagNumber(61)
  set createAt($core.String value) => $_setString(33, value);
  @$pb.TagNumber(61)
  $core.bool hasCreateAt() => $_has(33);
  @$pb.TagNumber(61)
  void clearCreateAt() => $_clearField(61);
}

///
///
/// Index                int64   `json:"序号"`
/// Code                 string  `json:"代码"`
/// Name                 string  `json:"名称"`
/// LastPrice            float64 `json:"最新价"`
/// ChangePct            float64 `json:"涨跌幅"`
/// ChangeAmt            float64 `json:"涨跌额"`
/// Volume               float64 `json:"成交量"`
/// Amount               float64 `json:"成交额"`
/// Amplitude            float64 `json:"振幅"`
/// High                 float64 `json:"最高"`
/// Low                  float64 `json:"最低"`
/// Open                 float64 `json:"今开"`
/// PrevClose            float64 `json:"昨收"`
/// VolumeRatio          float64 `json:"量比"`
/// TurnoverRate         float64 `json:"换手率"`
/// PeDynamic            float64 `json:"市盈率-动态"`
/// PbRatio              float64 `json:"市净率"`
/// TotalMarketCap       float64 `json:"总市值"`
/// CirculatingMarketCap float64 `json:"流通市值"`
/// PriceSpeed           float64 `json:"涨速"`
/// FiveMinChange        float64 `json:"5分钟涨跌"`
/// SixtyDayChangePct    float64 `json:"60日涨跌幅"`
/// YtdChangePct         float64 `json:"年初至今涨跌幅"`
class DBStockRealTimeItem extends $pb.GeneratedMessage {
  factory DBStockRealTimeItem({
    $core.String? code,
    $core.String? name,
    $core.double? lastPrice,
    $core.double? changePct,
    $core.double? changeAmt,
    $core.double? volume,
    $core.double? amount,
    $core.double? amplitude,
    $core.double? high,
    $core.double? low,
    $core.double? open,
    $core.double? prevClose,
    $core.double? volumeRatio,
    $core.double? turnoverRate,
    $core.double? peDynamic,
    $core.double? pbRatio,
    $core.double? totalMarketCap,
    $core.double? circulatingMarketCap,
    $core.double? priceSpeed,
    $core.double? fiveMinChange,
    $core.double? sixtyDayChangePct,
    $core.double? ytdChangePct,
  }) {
    final result = create();
    if (code != null) result.code = code;
    if (name != null) result.name = name;
    if (lastPrice != null) result.lastPrice = lastPrice;
    if (changePct != null) result.changePct = changePct;
    if (changeAmt != null) result.changeAmt = changeAmt;
    if (volume != null) result.volume = volume;
    if (amount != null) result.amount = amount;
    if (amplitude != null) result.amplitude = amplitude;
    if (high != null) result.high = high;
    if (low != null) result.low = low;
    if (open != null) result.open = open;
    if (prevClose != null) result.prevClose = prevClose;
    if (volumeRatio != null) result.volumeRatio = volumeRatio;
    if (turnoverRate != null) result.turnoverRate = turnoverRate;
    if (peDynamic != null) result.peDynamic = peDynamic;
    if (pbRatio != null) result.pbRatio = pbRatio;
    if (totalMarketCap != null) result.totalMarketCap = totalMarketCap;
    if (circulatingMarketCap != null)
      result.circulatingMarketCap = circulatingMarketCap;
    if (priceSpeed != null) result.priceSpeed = priceSpeed;
    if (fiveMinChange != null) result.fiveMinChange = fiveMinChange;
    if (sixtyDayChangePct != null) result.sixtyDayChangePct = sixtyDayChangePct;
    if (ytdChangePct != null) result.ytdChangePct = ytdChangePct;
    return result;
  }

  DBStockRealTimeItem._();

  factory DBStockRealTimeItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DBStockRealTimeItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DBStockRealTimeItem',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Code', protoName: 'Code')
    ..aOS(2, _omitFieldNames ? '' : 'Name', protoName: 'Name')
    ..aD(3, _omitFieldNames ? '' : 'LastPrice', protoName: 'LastPrice')
    ..aD(4, _omitFieldNames ? '' : 'ChangePct', protoName: 'ChangePct')
    ..aD(5, _omitFieldNames ? '' : 'ChangeAmt', protoName: 'ChangeAmt')
    ..aD(6, _omitFieldNames ? '' : 'Volume', protoName: 'Volume')
    ..aD(7, _omitFieldNames ? '' : 'Amount', protoName: 'Amount')
    ..aD(8, _omitFieldNames ? '' : 'Amplitude', protoName: 'Amplitude')
    ..aD(9, _omitFieldNames ? '' : 'High', protoName: 'High')
    ..aD(10, _omitFieldNames ? '' : 'Low', protoName: 'Low')
    ..aD(11, _omitFieldNames ? '' : 'Open', protoName: 'Open')
    ..aD(12, _omitFieldNames ? '' : 'PrevClose', protoName: 'PrevClose')
    ..aD(13, _omitFieldNames ? '' : 'VolumeRatio', protoName: 'VolumeRatio')
    ..aD(14, _omitFieldNames ? '' : 'TurnoverRate', protoName: 'TurnoverRate')
    ..aD(15, _omitFieldNames ? '' : 'PeDynamic', protoName: 'PeDynamic')
    ..aD(16, _omitFieldNames ? '' : 'PbRatio', protoName: 'PbRatio')
    ..aD(17, _omitFieldNames ? '' : 'TotalMarketCap',
        protoName: 'TotalMarketCap')
    ..aD(18, _omitFieldNames ? '' : 'CirculatingMarketCap',
        protoName: 'CirculatingMarketCap')
    ..aD(19, _omitFieldNames ? '' : 'PriceSpeed', protoName: 'PriceSpeed')
    ..aD(20, _omitFieldNames ? '' : 'FiveMinChange', protoName: 'FiveMinChange')
    ..aD(21, _omitFieldNames ? '' : 'SixtyDayChangePct',
        protoName: 'SixtyDayChangePct')
    ..aD(22, _omitFieldNames ? '' : 'YtdChangePct', protoName: 'YtdChangePct')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DBStockRealTimeItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DBStockRealTimeItem copyWith(void Function(DBStockRealTimeItem) updates) =>
      super.copyWith((message) => updates(message as DBStockRealTimeItem))
          as DBStockRealTimeItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DBStockRealTimeItem create() => DBStockRealTimeItem._();
  @$core.override
  DBStockRealTimeItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DBStockRealTimeItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DBStockRealTimeItem>(create);
  static DBStockRealTimeItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get lastPrice => $_getN(2);
  @$pb.TagNumber(3)
  set lastPrice($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLastPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastPrice() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get changePct => $_getN(3);
  @$pb.TagNumber(4)
  set changePct($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasChangePct() => $_has(3);
  @$pb.TagNumber(4)
  void clearChangePct() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get changeAmt => $_getN(4);
  @$pb.TagNumber(5)
  set changeAmt($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasChangeAmt() => $_has(4);
  @$pb.TagNumber(5)
  void clearChangeAmt() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get volume => $_getN(5);
  @$pb.TagNumber(6)
  set volume($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasVolume() => $_has(5);
  @$pb.TagNumber(6)
  void clearVolume() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.double get amount => $_getN(6);
  @$pb.TagNumber(7)
  set amount($core.double value) => $_setDouble(6, value);
  @$pb.TagNumber(7)
  $core.bool hasAmount() => $_has(6);
  @$pb.TagNumber(7)
  void clearAmount() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.double get amplitude => $_getN(7);
  @$pb.TagNumber(8)
  set amplitude($core.double value) => $_setDouble(7, value);
  @$pb.TagNumber(8)
  $core.bool hasAmplitude() => $_has(7);
  @$pb.TagNumber(8)
  void clearAmplitude() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.double get high => $_getN(8);
  @$pb.TagNumber(9)
  set high($core.double value) => $_setDouble(8, value);
  @$pb.TagNumber(9)
  $core.bool hasHigh() => $_has(8);
  @$pb.TagNumber(9)
  void clearHigh() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.double get low => $_getN(9);
  @$pb.TagNumber(10)
  set low($core.double value) => $_setDouble(9, value);
  @$pb.TagNumber(10)
  $core.bool hasLow() => $_has(9);
  @$pb.TagNumber(10)
  void clearLow() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.double get open => $_getN(10);
  @$pb.TagNumber(11)
  set open($core.double value) => $_setDouble(10, value);
  @$pb.TagNumber(11)
  $core.bool hasOpen() => $_has(10);
  @$pb.TagNumber(11)
  void clearOpen() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.double get prevClose => $_getN(11);
  @$pb.TagNumber(12)
  set prevClose($core.double value) => $_setDouble(11, value);
  @$pb.TagNumber(12)
  $core.bool hasPrevClose() => $_has(11);
  @$pb.TagNumber(12)
  void clearPrevClose() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.double get volumeRatio => $_getN(12);
  @$pb.TagNumber(13)
  set volumeRatio($core.double value) => $_setDouble(12, value);
  @$pb.TagNumber(13)
  $core.bool hasVolumeRatio() => $_has(12);
  @$pb.TagNumber(13)
  void clearVolumeRatio() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.double get turnoverRate => $_getN(13);
  @$pb.TagNumber(14)
  set turnoverRate($core.double value) => $_setDouble(13, value);
  @$pb.TagNumber(14)
  $core.bool hasTurnoverRate() => $_has(13);
  @$pb.TagNumber(14)
  void clearTurnoverRate() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.double get peDynamic => $_getN(14);
  @$pb.TagNumber(15)
  set peDynamic($core.double value) => $_setDouble(14, value);
  @$pb.TagNumber(15)
  $core.bool hasPeDynamic() => $_has(14);
  @$pb.TagNumber(15)
  void clearPeDynamic() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.double get pbRatio => $_getN(15);
  @$pb.TagNumber(16)
  set pbRatio($core.double value) => $_setDouble(15, value);
  @$pb.TagNumber(16)
  $core.bool hasPbRatio() => $_has(15);
  @$pb.TagNumber(16)
  void clearPbRatio() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.double get totalMarketCap => $_getN(16);
  @$pb.TagNumber(17)
  set totalMarketCap($core.double value) => $_setDouble(16, value);
  @$pb.TagNumber(17)
  $core.bool hasTotalMarketCap() => $_has(16);
  @$pb.TagNumber(17)
  void clearTotalMarketCap() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.double get circulatingMarketCap => $_getN(17);
  @$pb.TagNumber(18)
  set circulatingMarketCap($core.double value) => $_setDouble(17, value);
  @$pb.TagNumber(18)
  $core.bool hasCirculatingMarketCap() => $_has(17);
  @$pb.TagNumber(18)
  void clearCirculatingMarketCap() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.double get priceSpeed => $_getN(18);
  @$pb.TagNumber(19)
  set priceSpeed($core.double value) => $_setDouble(18, value);
  @$pb.TagNumber(19)
  $core.bool hasPriceSpeed() => $_has(18);
  @$pb.TagNumber(19)
  void clearPriceSpeed() => $_clearField(19);

  @$pb.TagNumber(20)
  $core.double get fiveMinChange => $_getN(19);
  @$pb.TagNumber(20)
  set fiveMinChange($core.double value) => $_setDouble(19, value);
  @$pb.TagNumber(20)
  $core.bool hasFiveMinChange() => $_has(19);
  @$pb.TagNumber(20)
  void clearFiveMinChange() => $_clearField(20);

  @$pb.TagNumber(21)
  $core.double get sixtyDayChangePct => $_getN(20);
  @$pb.TagNumber(21)
  set sixtyDayChangePct($core.double value) => $_setDouble(20, value);
  @$pb.TagNumber(21)
  $core.bool hasSixtyDayChangePct() => $_has(20);
  @$pb.TagNumber(21)
  void clearSixtyDayChangePct() => $_clearField(21);

  @$pb.TagNumber(22)
  $core.double get ytdChangePct => $_getN(21);
  @$pb.TagNumber(22)
  set ytdChangePct($core.double value) => $_setDouble(21, value);
  @$pb.TagNumber(22)
  $core.bool hasYtdChangePct() => $_has(21);
  @$pb.TagNumber(22)
  void clearYtdChangePct() => $_clearField(22);
}

/// 日/周/月K线（行情）
class DBStockBar extends $pb.GeneratedMessage {
  factory DBStockBar({
    $core.String? id,
    $core.String? symbol,
    $core.String? market,
    $core.String? timeframe,
    $core.String? ts,
    $core.double? open,
    $core.double? high,
    $core.double? low,
    $core.double? close,
    $fixnum.Int64? volume,
    $core.double? turnover,
    $core.double? adjFactor,
    $core.String? source,
    $core.String? createAt,
    $core.String? updateAt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (symbol != null) result.symbol = symbol;
    if (market != null) result.market = market;
    if (timeframe != null) result.timeframe = timeframe;
    if (ts != null) result.ts = ts;
    if (open != null) result.open = open;
    if (high != null) result.high = high;
    if (low != null) result.low = low;
    if (close != null) result.close = close;
    if (volume != null) result.volume = volume;
    if (turnover != null) result.turnover = turnover;
    if (adjFactor != null) result.adjFactor = adjFactor;
    if (source != null) result.source = source;
    if (createAt != null) result.createAt = createAt;
    if (updateAt != null) result.updateAt = updateAt;
    return result;
  }

  DBStockBar._();

  factory DBStockBar.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DBStockBar.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DBStockBar',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Id', protoName: 'Id')
    ..aOS(2, _omitFieldNames ? '' : 'Symbol', protoName: 'Symbol')
    ..aOS(3, _omitFieldNames ? '' : 'Market', protoName: 'Market')
    ..aOS(4, _omitFieldNames ? '' : 'Timeframe', protoName: 'Timeframe')
    ..aOS(5, _omitFieldNames ? '' : 'Ts', protoName: 'Ts')
    ..aD(6, _omitFieldNames ? '' : 'Open', protoName: 'Open')
    ..aD(7, _omitFieldNames ? '' : 'High', protoName: 'High')
    ..aD(8, _omitFieldNames ? '' : 'Low', protoName: 'Low')
    ..aD(9, _omitFieldNames ? '' : 'Close', protoName: 'Close')
    ..aInt64(10, _omitFieldNames ? '' : 'Volume', protoName: 'Volume')
    ..aD(11, _omitFieldNames ? '' : 'Turnover', protoName: 'Turnover')
    ..aD(12, _omitFieldNames ? '' : 'AdjFactor', protoName: 'AdjFactor')
    ..aOS(13, _omitFieldNames ? '' : 'Source', protoName: 'Source')
    ..aOS(14, _omitFieldNames ? '' : 'CreateAt', protoName: 'CreateAt')
    ..aOS(15, _omitFieldNames ? '' : 'UpdateAt', protoName: 'UpdateAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DBStockBar clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DBStockBar copyWith(void Function(DBStockBar) updates) =>
      super.copyWith((message) => updates(message as DBStockBar)) as DBStockBar;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DBStockBar create() => DBStockBar._();
  @$core.override
  DBStockBar createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DBStockBar getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DBStockBar>(create);
  static DBStockBar? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get symbol => $_getSZ(1);
  @$pb.TagNumber(2)
  set symbol($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSymbol() => $_has(1);
  @$pb.TagNumber(2)
  void clearSymbol() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get market => $_getSZ(2);
  @$pb.TagNumber(3)
  set market($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMarket() => $_has(2);
  @$pb.TagNumber(3)
  void clearMarket() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get timeframe => $_getSZ(3);
  @$pb.TagNumber(4)
  set timeframe($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTimeframe() => $_has(3);
  @$pb.TagNumber(4)
  void clearTimeframe() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get ts => $_getSZ(4);
  @$pb.TagNumber(5)
  set ts($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTs() => $_has(4);
  @$pb.TagNumber(5)
  void clearTs() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get open => $_getN(5);
  @$pb.TagNumber(6)
  set open($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasOpen() => $_has(5);
  @$pb.TagNumber(6)
  void clearOpen() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.double get high => $_getN(6);
  @$pb.TagNumber(7)
  set high($core.double value) => $_setDouble(6, value);
  @$pb.TagNumber(7)
  $core.bool hasHigh() => $_has(6);
  @$pb.TagNumber(7)
  void clearHigh() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.double get low => $_getN(7);
  @$pb.TagNumber(8)
  set low($core.double value) => $_setDouble(7, value);
  @$pb.TagNumber(8)
  $core.bool hasLow() => $_has(7);
  @$pb.TagNumber(8)
  void clearLow() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.double get close => $_getN(8);
  @$pb.TagNumber(9)
  set close($core.double value) => $_setDouble(8, value);
  @$pb.TagNumber(9)
  $core.bool hasClose() => $_has(8);
  @$pb.TagNumber(9)
  void clearClose() => $_clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get volume => $_getI64(9);
  @$pb.TagNumber(10)
  set volume($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasVolume() => $_has(9);
  @$pb.TagNumber(10)
  void clearVolume() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.double get turnover => $_getN(10);
  @$pb.TagNumber(11)
  set turnover($core.double value) => $_setDouble(10, value);
  @$pb.TagNumber(11)
  $core.bool hasTurnover() => $_has(10);
  @$pb.TagNumber(11)
  void clearTurnover() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.double get adjFactor => $_getN(11);
  @$pb.TagNumber(12)
  set adjFactor($core.double value) => $_setDouble(11, value);
  @$pb.TagNumber(12)
  $core.bool hasAdjFactor() => $_has(11);
  @$pb.TagNumber(12)
  void clearAdjFactor() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get source => $_getSZ(12);
  @$pb.TagNumber(13)
  set source($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasSource() => $_has(12);
  @$pb.TagNumber(13)
  void clearSource() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get createAt => $_getSZ(13);
  @$pb.TagNumber(14)
  set createAt($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasCreateAt() => $_has(13);
  @$pb.TagNumber(14)
  void clearCreateAt() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.String get updateAt => $_getSZ(14);
  @$pb.TagNumber(15)
  set updateAt($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasUpdateAt() => $_has(14);
  @$pb.TagNumber(15)
  void clearUpdateAt() => $_clearField(15);
}

/// 股票新闻
class DBStockNews extends $pb.GeneratedMessage {
  factory DBStockNews({
    $core.String? id,
    $core.String? symbol,
    $core.String? market,
    $core.String? ts,
    $core.String? title,
    $core.String? source,
    $core.String? createAt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (symbol != null) result.symbol = symbol;
    if (market != null) result.market = market;
    if (ts != null) result.ts = ts;
    if (title != null) result.title = title;
    if (source != null) result.source = source;
    if (createAt != null) result.createAt = createAt;
    return result;
  }

  DBStockNews._();

  factory DBStockNews.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DBStockNews.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DBStockNews',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Id', protoName: 'Id')
    ..aOS(2, _omitFieldNames ? '' : 'Symbol', protoName: 'Symbol')
    ..aOS(3, _omitFieldNames ? '' : 'Market', protoName: 'Market')
    ..aOS(4, _omitFieldNames ? '' : 'Ts', protoName: 'Ts')
    ..aOS(5, _omitFieldNames ? '' : 'Title', protoName: 'Title')
    ..aOS(6, _omitFieldNames ? '' : 'Source', protoName: 'Source')
    ..aOS(7, _omitFieldNames ? '' : 'CreateAt', protoName: 'CreateAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DBStockNews clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DBStockNews copyWith(void Function(DBStockNews) updates) =>
      super.copyWith((message) => updates(message as DBStockNews))
          as DBStockNews;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DBStockNews create() => DBStockNews._();
  @$core.override
  DBStockNews createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DBStockNews getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DBStockNews>(create);
  static DBStockNews? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get symbol => $_getSZ(1);
  @$pb.TagNumber(2)
  set symbol($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSymbol() => $_has(1);
  @$pb.TagNumber(2)
  void clearSymbol() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get market => $_getSZ(2);
  @$pb.TagNumber(3)
  set market($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMarket() => $_has(2);
  @$pb.TagNumber(3)
  void clearMarket() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get ts => $_getSZ(3);
  @$pb.TagNumber(4)
  set ts($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTs() => $_has(3);
  @$pb.TagNumber(4)
  void clearTs() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get title => $_getSZ(4);
  @$pb.TagNumber(5)
  set title($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearTitle() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get source => $_getSZ(5);
  @$pb.TagNumber(6)
  set source($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasSource() => $_has(5);
  @$pb.TagNumber(6)
  void clearSource() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get createAt => $_getSZ(6);
  @$pb.TagNumber(7)
  set createAt($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCreateAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreateAt() => $_clearField(7);
}

/// 股票分析报告 每日
class DBStockReport extends $pb.GeneratedMessage {
  factory DBStockReport({
    $core.String? id,
    $core.String? symbol,
    $core.String? market,
    $core.String? ts,
    $core.String? source,
    $core.String? createAt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (symbol != null) result.symbol = symbol;
    if (market != null) result.market = market;
    if (ts != null) result.ts = ts;
    if (source != null) result.source = source;
    if (createAt != null) result.createAt = createAt;
    return result;
  }

  DBStockReport._();

  factory DBStockReport.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DBStockReport.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DBStockReport',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Id', protoName: 'Id')
    ..aOS(2, _omitFieldNames ? '' : 'Symbol', protoName: 'Symbol')
    ..aOS(3, _omitFieldNames ? '' : 'Market', protoName: 'Market')
    ..aOS(4, _omitFieldNames ? '' : 'Ts', protoName: 'Ts')
    ..aOS(5, _omitFieldNames ? '' : 'Source', protoName: 'Source')
    ..aOS(6, _omitFieldNames ? '' : 'CreateAt', protoName: 'CreateAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DBStockReport clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DBStockReport copyWith(void Function(DBStockReport) updates) =>
      super.copyWith((message) => updates(message as DBStockReport))
          as DBStockReport;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DBStockReport create() => DBStockReport._();
  @$core.override
  DBStockReport createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DBStockReport getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DBStockReport>(create);
  static DBStockReport? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get symbol => $_getSZ(1);
  @$pb.TagNumber(2)
  set symbol($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSymbol() => $_has(1);
  @$pb.TagNumber(2)
  void clearSymbol() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get market => $_getSZ(2);
  @$pb.TagNumber(3)
  set market($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMarket() => $_has(2);
  @$pb.TagNumber(3)
  void clearMarket() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get ts => $_getSZ(3);
  @$pb.TagNumber(4)
  set ts($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTs() => $_has(3);
  @$pb.TagNumber(4)
  void clearTs() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get source => $_getSZ(4);
  @$pb.TagNumber(5)
  set source($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSource() => $_has(4);
  @$pb.TagNumber(5)
  void clearSource() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get createAt => $_getSZ(5);
  @$pb.TagNumber(6)
  set createAt($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCreateAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreateAt() => $_clearField(6);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
