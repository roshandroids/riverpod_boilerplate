import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_boilerplate/src/core/core.dart';

/// Http service implementation using the Dio package
///
/// See https://pub.dev/packages/dio
class HttpServiceImpl implements HttpService {
  /// Creates new instance of [HttpServiceImpl]
  HttpServiceImpl({
    Dio? dioOverride,
  }) {
    dio = dioOverride ?? Dio(baseOptions);
    dio.interceptors.add(NetworkInterceptor());
  }

  /// The Dio Http client
  late final Dio dio;

  @override
  String get baseUrl => '${dotenv.env['base_url']}';

  /// The Dio base options
  BaseOptions get baseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );

  @override
  Map<String, String> headers = {
    'accept': 'application/json',
    'content-type': 'application/json',
  };

  @override
  Future<Either<Failure, Response<dynamic>>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    String? customBaseUrl,
    CancelToken? cancelToken,
  }) async {
    try {
      final Response<dynamic> response = await dio.get<Map<String, dynamic>>(
        endpoint,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
      return Right(response);
    } on DioError catch (e) {
      return Left(e.toFailure);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, Response<dynamic>>> post(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Response<dynamic>>> delete(
    String endpoint, {
    CancelToken? cancelToken,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Response<dynamic>>> put(
    String endpoint, {
    CancelToken? cancelToken,
  }) {
    throw UnimplementedError();
  }
}
