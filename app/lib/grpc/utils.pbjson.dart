///
//  Generated code. Do not modify.
//  source: utils.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use kondateTypeDescriptor instead')
const KondateType$json = const {
  '1': 'KondateType',
  '2': const [
    const {'1': 'BREAKFAST', '2': 0},
    const {'1': 'LUNCH', '2': 1},
    const {'1': 'DINNER', '2': 2},
  ],
};

/// Descriptor for `KondateType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List kondateTypeDescriptor = $convert.base64Decode('CgtLb25kYXRlVHlwZRINCglCUkVBS0ZBU1QQABIJCgVMVU5DSBABEgoKBkRJTk5FUhAC');
@$core.Deprecated('Use resultDescriptor instead')
const Result$json = const {
  '1': 'Result',
  '2': const [
    const {'1': 'SUCCESS', '2': 0},
    const {'1': 'NOT_FOUND', '2': 1},
    const {'1': 'INTERNAL_ERROR', '2': 2},
  ],
};

/// Descriptor for `Result`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List resultDescriptor = $convert.base64Decode('CgZSZXN1bHQSCwoHU1VDQ0VTUxAAEg0KCU5PVF9GT1VORBABEhIKDklOVEVSTkFMX0VSUk9SEAI=');
@$core.Deprecated('Use dateDescriptor instead')
const Date$json = const {
  '1': 'Date',
  '2': const [
    const {'1': 'year', '3': 1, '4': 1, '5': 5, '10': 'year'},
    const {'1': 'month', '3': 2, '4': 1, '5': 5, '10': 'month'},
    const {'1': 'dayofmonth', '3': 3, '4': 1, '5': 5, '10': 'dayofmonth'},
  ],
};

/// Descriptor for `Date`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dateDescriptor = $convert.base64Decode('CgREYXRlEhIKBHllYXIYASABKAVSBHllYXISFAoFbW9udGgYAiABKAVSBW1vbnRoEh4KCmRheW9mbW9udGgYAyABKAVSCmRheW9mbW9udGg=');
