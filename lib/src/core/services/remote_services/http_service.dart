import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_boilerplate/src/core/core.dart';

/// Http Service Interface
abstract class HttpService {
  /// Http base url
  String get baseUrl;

  /// Http headers
  Map<String, String> get headers;

  /// Http get request
  Future<Either<Failure, Response<dynamic>>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  });

  /// Http post request
  Future<Either<Failure, Response<dynamic>>> post(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  });

  /// Http put request
  Future<Either<Failure, Response<dynamic>>> put(
    String endpoint, {
    CancelToken? cancelToken,
  });

  /// Http delete request
  Future<Either<Failure, Response<dynamic>>> delete(
    String endpoint, {
    CancelToken? cancelToken,
  });
}
