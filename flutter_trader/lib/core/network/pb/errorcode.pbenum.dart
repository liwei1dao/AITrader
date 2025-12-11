// This is a generated file - do not edit.
//
// Generated from errorcode.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ErrorCode extends $pb.ProtobufEnum {
  static const ErrorCode Success =
      ErrorCode._(0, _omitEnumNames ? '' : 'Success');
  static const ErrorCode GatewayException =
      ErrorCode._(1, _omitEnumNames ? '' : 'GatewayException');
  static const ErrorCode NoFindService =
      ErrorCode._(10, _omitEnumNames ? '' : 'NoFindService');
  static const ErrorCode NoFindServiceHandleFunc =
      ErrorCode._(11, _omitEnumNames ? '' : 'NoFindServiceHandleFunc');
  static const ErrorCode RpcFuncExecutionError =
      ErrorCode._(12, _omitEnumNames ? '' : 'RpcFuncExecutionError');
  static const ErrorCode CacheReadError =
      ErrorCode._(13, _omitEnumNames ? '' : 'CacheReadError');
  static const ErrorCode SqlExecutionError =
      ErrorCode._(14, _omitEnumNames ? '' : 'SqlExecutionError');
  static const ErrorCode ReqParameterError =
      ErrorCode._(15, _omitEnumNames ? '' : 'ReqParameterError');
  static const ErrorCode SignError =
      ErrorCode._(16, _omitEnumNames ? '' : 'SignError');
  static const ErrorCode InsufficientPermissions =
      ErrorCode._(17, _omitEnumNames ? '' : 'InsufficientPermissions');
  static const ErrorCode NoLogin =
      ErrorCode._(18, _omitEnumNames ? '' : 'NoLogin');
  static const ErrorCode UserSessionNobeing =
      ErrorCode._(19, _omitEnumNames ? '' : 'UserSessionNobeing');
  static const ErrorCode StateInvalid =
      ErrorCode._(20, _omitEnumNames ? '' : 'StateInvalid');
  static const ErrorCode DBError =
      ErrorCode._(21, _omitEnumNames ? '' : 'DBError');
  static const ErrorCode SystemError =
      ErrorCode._(22, _omitEnumNames ? '' : 'SystemError');
  static const ErrorCode DecodeError =
      ErrorCode._(23, _omitEnumNames ? '' : 'DecodeError');
  static const ErrorCode TimestampTimeout =
      ErrorCode._(24, _omitEnumNames ? '' : 'TimestampTimeout');
  static const ErrorCode PbError =
      ErrorCode._(25, _omitEnumNames ? '' : 'PbError');
  static const ErrorCode AgentUidEmpty =
      ErrorCode._(26, _omitEnumNames ? '' : 'AgentUidEmpty');
  static const ErrorCode ConfigNoFound =
      ErrorCode._(27, _omitEnumNames ? '' : 'ConfigNoFound');
  static const ErrorCode DecryptError =
      ErrorCode._(28, _omitEnumNames ? '' : 'DecryptError');
  static const ErrorCode ClientError =
      ErrorCode._(29, _omitEnumNames ? '' : 'ClientError');
  static const ErrorCode Exception =
      ErrorCode._(100, _omitEnumNames ? '' : 'Exception');
  static const ErrorCode AgentBetExchangeError =
      ErrorCode._(101, _omitEnumNames ? '' : 'AgentBetExchangeError');
  static const ErrorCode GameInMaintenance =
      ErrorCode._(102, _omitEnumNames ? '' : 'GameInMaintenance');
  static const ErrorCode NoCanBet =
      ErrorCode._(103, _omitEnumNames ? '' : 'NoCanBet');
  static const ErrorCode NoFindRoom =
      ErrorCode._(104, _omitEnumNames ? '' : 'NoFindRoom');
  static const ErrorCode AgentNofund =
      ErrorCode._(105, _omitEnumNames ? '' : 'AgentNofund');
  static const ErrorCode NetWorkError =
      ErrorCode._(106, _omitEnumNames ? '' : 'NetWorkError');

  static const $core.List<ErrorCode> values = <ErrorCode>[
    Success,
    GatewayException,
    NoFindService,
    NoFindServiceHandleFunc,
    RpcFuncExecutionError,
    CacheReadError,
    SqlExecutionError,
    ReqParameterError,
    SignError,
    InsufficientPermissions,
    NoLogin,
    UserSessionNobeing,
    StateInvalid,
    DBError,
    SystemError,
    DecodeError,
    TimestampTimeout,
    PbError,
    AgentUidEmpty,
    ConfigNoFound,
    DecryptError,
    ClientError,
    Exception,
    AgentBetExchangeError,
    GameInMaintenance,
    NoCanBet,
    NoFindRoom,
    AgentNofund,
    NetWorkError,
  ];

  static final $core.Map<$core.int, ErrorCode> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ErrorCode? valueOf($core.int value) => _byValue[value];

  const ErrorCode._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
