import 'dart:developer';
import 'package:dio/dio.dart';

class ApiClient {
  late Dio _dio;

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://uat.keev.co.in/',
        connectTimeout: const Duration(seconds: 5000),
        receiveTimeout: const Duration(seconds: 5000),
        headers: {
          'Accept': 'application/json',
        },
      ),
    );

    // Add interceptors
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Do something before request is sent
          return handler.next(options); //continue
        },
        onResponse: (response, handler) {
          // Do something with response data
          return handler.next(response); // continue
        },
        onError: (DioException e, handler) {
          // Do something with response error
          return handler.next(e); //continue
        },
      ),
    );
  }

  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParams,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      log('Error: $e');
      rethrow; // Rethrow the error for handling in UI
    }
  }

  Future<dynamic> post(
    String endpoint, {
    Object? data,
  }) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      log('Error: $e');
      rethrow; // Rethrow the error for handling in UI
    }
  }

  void close() {
    _dio.close();
  }
}
