///
//  Generated code. Do not modify.
//  source: v1/info_distributor_v1.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import '../utils.pb.dart' as $0;
import 'info_distributor_v1.pb.dart' as $1;
export 'info_distributor_v1.pb.dart';

class KInfoDistributorV1Client extends $grpc.Client {
  static final _$get = $grpc.ClientMethod<$0.Date, $1.KInfoResponse>(
      '/proto.v1.KInfoDistributorV1/get',
      ($0.Date value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.KInfoResponse.fromBuffer(value));
  static final _$search =
      $grpc.ClientMethod<$1.KInfoSearchRequest, $1.KInfoSearchResponse>(
          '/proto.v1.KInfoDistributorV1/search',
          ($1.KInfoSearchRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.KInfoSearchResponse.fromBuffer(value));

  KInfoDistributorV1Client($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.KInfoResponse> get($0.Date request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get, request, options: options);
  }

  $grpc.ResponseFuture<$1.KInfoSearchResponse> search(
      $1.KInfoSearchRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$search, request, options: options);
  }
}

abstract class KInfoDistributorV1ServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.v1.KInfoDistributorV1';

  KInfoDistributorV1ServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Date, $1.KInfoResponse>(
        'get',
        get_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Date.fromBuffer(value),
        ($1.KInfoResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.KInfoSearchRequest, $1.KInfoSearchResponse>(
            'search',
            search_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.KInfoSearchRequest.fromBuffer(value),
            ($1.KInfoSearchResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.KInfoResponse> get_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Date> request) async {
    return get(call, await request);
  }

  $async.Future<$1.KInfoSearchResponse> search_Pre($grpc.ServiceCall call,
      $async.Future<$1.KInfoSearchRequest> request) async {
    return search(call, await request);
  }

  $async.Future<$1.KInfoResponse> get($grpc.ServiceCall call, $0.Date request);
  $async.Future<$1.KInfoSearchResponse> search(
      $grpc.ServiceCall call, $1.KInfoSearchRequest request);
}
