import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shop_app_clean/core/error/exceptions.dart';
import 'package:shop_app_clean/core/models/error_message_model.dart';
import 'package:shop_app_clean/core/utils/constants.dart';

class DioClient {
  final Dio _dio;

  DioClient({String? baseUrl})
      : _dio = Dio(BaseOptions(
          baseUrl: baseUrl ?? Constants.BASE_URL, // Provide a default base URL
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
          headers: {
            'Content-Type': 'application/json',
          },
        )) {
    _dio.interceptors.add(LogInterceptor(responseBody: true)); // Add logging
    // Add other interceptors (e.g., auth) if needed
  }

  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.get(path,
          queryParameters: queryParameters, options: Options(headers: headers));
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
      return null; // unreachable due to _handleDioError, makes the linter happy
    }
  }

  Future<dynamic> post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.post(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
      return null; // unreachable due to _handleDioError, makes the linter happy
    }
  }

  Future<dynamic> put(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.put(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
      return null;
    }
  }

  Future<dynamic> delete(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.delete(path,
          queryParameters: queryParameters, options: Options(headers: headers));
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
      return null;
    }
  }

  Future<dynamic> patch(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.patch(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
      return null;
    }
  }

  void _handleDioError(DioException error) {
    if (error.response != null) {
      // Server error (e.g., 400, 500)
      throw ServerException(ErrorMessageModel.fromJson(error.response!.data));
    } else {
      // Network error (no response)
      log('Something went Wrong: ${error.message}');
      // throw NetworkException(message: error.message ?? 'Network error');
    }
  }
}
