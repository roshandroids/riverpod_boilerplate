import 'dart:developer';

import 'package:dio/dio.dart';

class NetworkInterceptor implements Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('❌ ❌ ❌ Dio Error!');
    log('❌ ❌ ❌ Url: ${err.requestOptions.uri}');
    log('❌ ❌ ❌ ${err.stackTrace}');
    log('❌ ❌ ❌ Response Errors: ${err.response?.data}');
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('🌍 🌍 🌍 Retrieving request from network');
    log('Url: ${options.uri}');
    log('Params: ${options.queryParameters}');
    return handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    log('🌍 🌍 🌍 Retrieved response from network');
    log('⬅️ ⬅️ ⬅️ Response');
    log('''<---- ${response.statusCode != 200 ? '❌ ${response.statusCode} ❌' : '✅ 200 ✅'} ${response.requestOptions.baseUrl}${response.requestOptions.path}''');
    log('Query params: ${response.requestOptions.queryParameters}');
    log('-------------------------');

    return handler.next(response);
  }
}
