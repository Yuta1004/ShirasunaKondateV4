///
//  Generated code. Do not modify.
//  source: v1/info_distributor_v1.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../utils.pb.dart' as $0;

import '../utils.pbenum.dart' as $0;

class KInfoResponse_Kondate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'KInfoResponse.Kondate', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto.v1'), createEmptyInstance: create)
    ..e<$0.KondateType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: $0.KondateType.BREAKFAST, valueOf: $0.KondateType.valueOf, enumValues: $0.KondateType.values)
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'menu')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'calorie', $pb.PbFieldType.O3)
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'carbohydrate', $pb.PbFieldType.OF)
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lipid', $pb.PbFieldType.OF)
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'protein', $pb.PbFieldType.OF)
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'salt', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  KInfoResponse_Kondate._() : super();
  factory KInfoResponse_Kondate({
    $0.KondateType? type,
    $core.Iterable<$core.String>? menu,
    $core.int? calorie,
    $core.double? carbohydrate,
    $core.double? lipid,
    $core.double? protein,
    $core.double? salt,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (menu != null) {
      _result.menu.addAll(menu);
    }
    if (calorie != null) {
      _result.calorie = calorie;
    }
    if (carbohydrate != null) {
      _result.carbohydrate = carbohydrate;
    }
    if (lipid != null) {
      _result.lipid = lipid;
    }
    if (protein != null) {
      _result.protein = protein;
    }
    if (salt != null) {
      _result.salt = salt;
    }
    return _result;
  }
  factory KInfoResponse_Kondate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KInfoResponse_Kondate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KInfoResponse_Kondate clone() => KInfoResponse_Kondate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KInfoResponse_Kondate copyWith(void Function(KInfoResponse_Kondate) updates) => super.copyWith((message) => updates(message as KInfoResponse_Kondate)) as KInfoResponse_Kondate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KInfoResponse_Kondate create() => KInfoResponse_Kondate._();
  KInfoResponse_Kondate createEmptyInstance() => create();
  static $pb.PbList<KInfoResponse_Kondate> createRepeated() => $pb.PbList<KInfoResponse_Kondate>();
  @$core.pragma('dart2js:noInline')
  static KInfoResponse_Kondate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KInfoResponse_Kondate>(create);
  static KInfoResponse_Kondate? _defaultInstance;

  @$pb.TagNumber(1)
  $0.KondateType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type($0.KondateType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get menu => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get calorie => $_getIZ(2);
  @$pb.TagNumber(3)
  set calorie($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCalorie() => $_has(2);
  @$pb.TagNumber(3)
  void clearCalorie() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get carbohydrate => $_getN(3);
  @$pb.TagNumber(4)
  set carbohydrate($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCarbohydrate() => $_has(3);
  @$pb.TagNumber(4)
  void clearCarbohydrate() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get lipid => $_getN(4);
  @$pb.TagNumber(5)
  set lipid($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLipid() => $_has(4);
  @$pb.TagNumber(5)
  void clearLipid() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get protein => $_getN(5);
  @$pb.TagNumber(6)
  set protein($core.double v) { $_setFloat(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasProtein() => $_has(5);
  @$pb.TagNumber(6)
  void clearProtein() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get salt => $_getN(6);
  @$pb.TagNumber(7)
  set salt($core.double v) { $_setFloat(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSalt() => $_has(6);
  @$pb.TagNumber(7)
  void clearSalt() => clearField(7);
}

class KInfoResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'KInfoResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto.v1'), createEmptyInstance: create)
    ..e<$0.Result>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result', $pb.PbFieldType.OE, defaultOrMaker: $0.Result.SUCCESS, valueOf: $0.Result.valueOf, enumValues: $0.Result.values)
    ..pc<KInfoResponse_Kondate>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'info', $pb.PbFieldType.PM, subBuilder: KInfoResponse_Kondate.create)
    ..hasRequiredFields = false
  ;

  KInfoResponse._() : super();
  factory KInfoResponse({
    $0.Result? result,
    $core.Iterable<KInfoResponse_Kondate>? info,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    if (info != null) {
      _result.info.addAll(info);
    }
    return _result;
  }
  factory KInfoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KInfoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KInfoResponse clone() => KInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KInfoResponse copyWith(void Function(KInfoResponse) updates) => super.copyWith((message) => updates(message as KInfoResponse)) as KInfoResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KInfoResponse create() => KInfoResponse._();
  KInfoResponse createEmptyInstance() => create();
  static $pb.PbList<KInfoResponse> createRepeated() => $pb.PbList<KInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static KInfoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KInfoResponse>(create);
  static KInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Result get result => $_getN(0);
  @$pb.TagNumber(1)
  set result($0.Result v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<KInfoResponse_Kondate> get info => $_getList(1);
}

class KInfoSearchRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'KInfoSearchRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'query')
    ..hasRequiredFields = false
  ;

  KInfoSearchRequest._() : super();
  factory KInfoSearchRequest({
    $core.String? query,
  }) {
    final _result = create();
    if (query != null) {
      _result.query = query;
    }
    return _result;
  }
  factory KInfoSearchRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KInfoSearchRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KInfoSearchRequest clone() => KInfoSearchRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KInfoSearchRequest copyWith(void Function(KInfoSearchRequest) updates) => super.copyWith((message) => updates(message as KInfoSearchRequest)) as KInfoSearchRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KInfoSearchRequest create() => KInfoSearchRequest._();
  KInfoSearchRequest createEmptyInstance() => create();
  static $pb.PbList<KInfoSearchRequest> createRepeated() => $pb.PbList<KInfoSearchRequest>();
  @$core.pragma('dart2js:noInline')
  static KInfoSearchRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KInfoSearchRequest>(create);
  static KInfoSearchRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get query => $_getSZ(0);
  @$pb.TagNumber(1)
  set query($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuery() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuery() => clearField(1);
}

class KInfoSearchResponse_SearchResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'KInfoSearchResponse.SearchResult', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto.v1'), createEmptyInstance: create)
    ..aOM<$0.Date>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'date', subBuilder: $0.Date.create)
    ..e<$0.KondateType>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: $0.KondateType.BREAKFAST, valueOf: $0.KondateType.valueOf, enumValues: $0.KondateType.values)
    ..hasRequiredFields = false
  ;

  KInfoSearchResponse_SearchResult._() : super();
  factory KInfoSearchResponse_SearchResult({
    $0.Date? date,
    $0.KondateType? type,
  }) {
    final _result = create();
    if (date != null) {
      _result.date = date;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory KInfoSearchResponse_SearchResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KInfoSearchResponse_SearchResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KInfoSearchResponse_SearchResult clone() => KInfoSearchResponse_SearchResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KInfoSearchResponse_SearchResult copyWith(void Function(KInfoSearchResponse_SearchResult) updates) => super.copyWith((message) => updates(message as KInfoSearchResponse_SearchResult)) as KInfoSearchResponse_SearchResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KInfoSearchResponse_SearchResult create() => KInfoSearchResponse_SearchResult._();
  KInfoSearchResponse_SearchResult createEmptyInstance() => create();
  static $pb.PbList<KInfoSearchResponse_SearchResult> createRepeated() => $pb.PbList<KInfoSearchResponse_SearchResult>();
  @$core.pragma('dart2js:noInline')
  static KInfoSearchResponse_SearchResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KInfoSearchResponse_SearchResult>(create);
  static KInfoSearchResponse_SearchResult? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Date get date => $_getN(0);
  @$pb.TagNumber(1)
  set date($0.Date v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearDate() => clearField(1);
  @$pb.TagNumber(1)
  $0.Date ensureDate() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.KondateType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type($0.KondateType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);
}

class KInfoSearchResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'KInfoSearchResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto.v1'), createEmptyInstance: create)
    ..e<$0.Result>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result', $pb.PbFieldType.OE, defaultOrMaker: $0.Result.SUCCESS, valueOf: $0.Result.valueOf, enumValues: $0.Result.values)
    ..pc<KInfoSearchResponse_SearchResult>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'searchResults', $pb.PbFieldType.PM, subBuilder: KInfoSearchResponse_SearchResult.create)
    ..hasRequiredFields = false
  ;

  KInfoSearchResponse._() : super();
  factory KInfoSearchResponse({
    $0.Result? result,
    $core.Iterable<KInfoSearchResponse_SearchResult>? searchResults,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    if (searchResults != null) {
      _result.searchResults.addAll(searchResults);
    }
    return _result;
  }
  factory KInfoSearchResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KInfoSearchResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KInfoSearchResponse clone() => KInfoSearchResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KInfoSearchResponse copyWith(void Function(KInfoSearchResponse) updates) => super.copyWith((message) => updates(message as KInfoSearchResponse)) as KInfoSearchResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KInfoSearchResponse create() => KInfoSearchResponse._();
  KInfoSearchResponse createEmptyInstance() => create();
  static $pb.PbList<KInfoSearchResponse> createRepeated() => $pb.PbList<KInfoSearchResponse>();
  @$core.pragma('dart2js:noInline')
  static KInfoSearchResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KInfoSearchResponse>(create);
  static KInfoSearchResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Result get result => $_getN(0);
  @$pb.TagNumber(1)
  set result($0.Result v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<KInfoSearchResponse_SearchResult> get searchResults => $_getList(1);
}

