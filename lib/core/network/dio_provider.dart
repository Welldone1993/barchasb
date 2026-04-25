import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  final options = BaseOptions(
    baseUrl: 'https://your-domain.com', // TODO: عوض کن
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );

  final dio = Dio(options);

  // Logging
  dio.interceptors.add(
    LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ),
  );

  // Token + Error Handling
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        // TODO: بعداً از secure storage توکن رو بخون
        // final token = await storage.read(key: 'access_token');
        // if (token != null) options.headers['Authorization'] = "Bearer $token";

        return handler.next(options);
      },
      onError: (e, handler) {
        if (e.response?.statusCode == 401) {
          // TODO: Refresh Token or Logout
        }
        return handler.next(e);
      },
    ),
  );

  return dio;
});
