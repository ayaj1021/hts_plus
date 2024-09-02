import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hts_plus/domain/model/app_response_model.dart';

abstract class Status {
  static bool error = false;
  static bool success = true;
}

class ExceptionHandler implements Exception {
  static handleError<T>(DioException error) {
    log('$error');

    // AppResponseModel<T>

    final response = switch (error.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout =>
        AppResponseModel<T>(
          message: 'Connection timed out',
          success: Status.error,
          error: [],
        ),
      DioException.badResponse when (error.response?.statusCode ?? 0) >= 500 =>
        AppResponseModel<T>(
          message: 'Server error occurred',
          success: Status.error,
          error: [],
        ),
      DioExceptionType.badResponse
          when error.response?.data is Map<String, dynamic> =>
        AppResponseModel<T>.fromJson(error.response?.data),
      DioExceptionType.badResponse => AppResponseModel<T>(
          message: "An error occurred",
          success: Status.error,
          error: [],
        ),
      DioExceptionType.cancel => AppResponseModel<T>(
          message: 'The API request was cancelled',
          success: Status.error,
          error: [],
        ),
      DioExceptionType.unknown => AppResponseModel<T>(
          message: 'Network error occurred',
          success: Status.error,
          error: [],
        ),
      _ => AppResponseModel<T>(
          message: "An error occurred",
          success: Status.error,
          error: [],
        ),
    };

    // return AppResponseModel(message: "An error occurred");
    return response;
  }
}
