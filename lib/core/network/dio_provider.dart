import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api_endpoints.dart';

final dioProvider = Provider<Dio>((ref) {
  final options = BaseOptions(
    baseUrl: ApiEndpoints.baseUrl,
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    headers: {
      'Content-Type': 'application/json',
    },
  );

  final dio = Dio(options);

  dio.interceptors.add(LogInterceptor(
    request: true,
    requestHeader: true,
    requestBody: true,
    responseHeader: true,
    responseBody: true,
    error: true,
  ));

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options,RequestInterceptorHandler handler) async {
        // TODO: after login → store token and read it here
        // options.headers['Authorization'] = token;
        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        // Mitoni inja response-ha ro ghabl az residan be UI dastkari koni
        return handler.next(response);
      },
      onError: (e, handler) {
        if (e.response?.statusCode == 401) {
          // TODO: Refresh token or logout
        }
        return handler.next(e);
      },
    ),
  );

  return dio;
});
