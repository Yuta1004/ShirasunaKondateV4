///
//  Generated code. Do not modify.
//  source: utils.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class KondateType extends $pb.ProtobufEnum {
  static const KondateType BREAKFAST = KondateType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BREAKFAST');
  static const KondateType LUNCH = KondateType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LUNCH');
  static const KondateType DINNER = KondateType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DINNER');

  static const $core.List<KondateType> values = <KondateType> [
    BREAKFAST,
    LUNCH,
    DINNER,
  ];

  static final $core.Map<$core.int, KondateType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static KondateType? valueOf($core.int value) => _byValue[value];

  const KondateType._($core.int v, $core.String n) : super(v, n);
}

class Result extends $pb.ProtobufEnum {
  static const Result SUCCESS = Result._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SUCCESS');
  static const Result NOT_FOUND = Result._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NOT_FOUND');
  static const Result INTERNAL_ERROR = Result._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INTERNAL_ERROR');

  static const $core.List<Result> values = <Result> [
    SUCCESS,
    NOT_FOUND,
    INTERNAL_ERROR,
  ];

  static final $core.Map<$core.int, Result> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Result? valueOf($core.int value) => _byValue[value];

  const Result._($core.int v, $core.String n) : super(v, n);
}

