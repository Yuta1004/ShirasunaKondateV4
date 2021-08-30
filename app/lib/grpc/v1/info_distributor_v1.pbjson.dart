///
//  Generated code. Do not modify.
//  source: v1/info_distributor_v1.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use kInfoResponseDescriptor instead')
const KInfoResponse$json = const {
  '1': 'KInfoResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 14, '6': '.proto.Result', '10': 'result'},
    const {'1': 'info', '3': 2, '4': 3, '5': 11, '6': '.proto.v1.KInfoResponse.Kondate', '10': 'info'},
  ],
  '3': const [KInfoResponse_Kondate$json],
};

@$core.Deprecated('Use kInfoResponseDescriptor instead')
const KInfoResponse_Kondate$json = const {
  '1': 'Kondate',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.proto.KondateType', '10': 'type'},
    const {'1': 'menu', '3': 2, '4': 3, '5': 9, '10': 'menu'},
    const {'1': 'calorie', '3': 3, '4': 1, '5': 5, '10': 'calorie'},
    const {'1': 'carbohydrate', '3': 4, '4': 1, '5': 2, '10': 'carbohydrate'},
    const {'1': 'lipid', '3': 5, '4': 1, '5': 2, '10': 'lipid'},
    const {'1': 'protein', '3': 6, '4': 1, '5': 2, '10': 'protein'},
    const {'1': 'salt', '3': 7, '4': 1, '5': 2, '10': 'salt'},
  ],
};

/// Descriptor for `KInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List kInfoResponseDescriptor = $convert.base64Decode('Cg1LSW5mb1Jlc3BvbnNlEiUKBnJlc3VsdBgBIAEoDjINLnByb3RvLlJlc3VsdFIGcmVzdWx0EjMKBGluZm8YAiADKAsyHy5wcm90by52MS5LSW5mb1Jlc3BvbnNlLktvbmRhdGVSBGluZm8axwEKB0tvbmRhdGUSJgoEdHlwZRgBIAEoDjISLnByb3RvLktvbmRhdGVUeXBlUgR0eXBlEhIKBG1lbnUYAiADKAlSBG1lbnUSGAoHY2Fsb3JpZRgDIAEoBVIHY2Fsb3JpZRIiCgxjYXJib2h5ZHJhdGUYBCABKAJSDGNhcmJvaHlkcmF0ZRIUCgVsaXBpZBgFIAEoAlIFbGlwaWQSGAoHcHJvdGVpbhgGIAEoAlIHcHJvdGVpbhISCgRzYWx0GAcgASgCUgRzYWx0');
@$core.Deprecated('Use kInfoSearchRequestDescriptor instead')
const KInfoSearchRequest$json = const {
  '1': 'KInfoSearchRequest',
  '2': const [
    const {'1': 'query', '3': 1, '4': 1, '5': 9, '10': 'query'},
  ],
};

/// Descriptor for `KInfoSearchRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List kInfoSearchRequestDescriptor = $convert.base64Decode('ChJLSW5mb1NlYXJjaFJlcXVlc3QSFAoFcXVlcnkYASABKAlSBXF1ZXJ5');
@$core.Deprecated('Use kInfoSearchResponseDescriptor instead')
const KInfoSearchResponse$json = const {
  '1': 'KInfoSearchResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 14, '6': '.proto.Result', '10': 'result'},
    const {'1': 'search_results', '3': 2, '4': 3, '5': 11, '6': '.proto.v1.KInfoSearchResponse.SearchResult', '10': 'searchResults'},
  ],
  '3': const [KInfoSearchResponse_SearchResult$json],
};

@$core.Deprecated('Use kInfoSearchResponseDescriptor instead')
const KInfoSearchResponse_SearchResult$json = const {
  '1': 'SearchResult',
  '2': const [
    const {'1': 'date', '3': 1, '4': 1, '5': 11, '6': '.proto.Date', '10': 'date'},
    const {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.proto.KondateType', '10': 'type'},
  ],
};

/// Descriptor for `KInfoSearchResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List kInfoSearchResponseDescriptor = $convert.base64Decode('ChNLSW5mb1NlYXJjaFJlc3BvbnNlEiUKBnJlc3VsdBgBIAEoDjINLnByb3RvLlJlc3VsdFIGcmVzdWx0ElEKDnNlYXJjaF9yZXN1bHRzGAIgAygLMioucHJvdG8udjEuS0luZm9TZWFyY2hSZXNwb25zZS5TZWFyY2hSZXN1bHRSDXNlYXJjaFJlc3VsdHMaVwoMU2VhcmNoUmVzdWx0Eh8KBGRhdGUYASABKAsyCy5wcm90by5EYXRlUgRkYXRlEiYKBHR5cGUYAiABKA4yEi5wcm90by5Lb25kYXRlVHlwZVIEdHlwZQ==');
