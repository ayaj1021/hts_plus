import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/constants/app_constants.dart';

class ApiService {
  final Dio _dio;
  String? message;

  ApiService({Dio? dio}) : _dio = dio ?? Dio() {
    _dio.options..baseUrl = AppConstants.baseUrl;

    //_dio.options.baseUrl = AppConstants.baseUrl;
    //..connectTimeout = const Duration(seconds: 60)
    // ..receiveTimeout = const Duration(seconds: 60);
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters, String? token}) async {
    // final storage = await SecureStorage();
    const _token = '';
    //await storage.getUserToken();
    //final _token = await SecureStorage().getUserToken();
    final response = await _dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(headers: _buildHeaders(_token)),
    );
    return response;
  }

  Future<Response> post(
      {required String path,
      String? message,
      required Map<String, dynamic>? data,
      String? token}) async {
    log('$data');
    // final storage = await SecureStorage();
    final _token = '';
    // await storage.getUserToken();
    //  final _token = await SecureStorage().getUserToken();
    final response = await _dio.post(
      path,
      data: data,
      options: Options(headers: _buildHeaders(_token)),
    );
    log('${response.data}');

    return response;
  }

  Future<Response> patch(
      {required String path,
      String? message,
      required Map<String, dynamic> data,
      String? token}) async {
    log('$data');
    final _token = '';
    final response = await _dio.patch(
      path,
      data: data,
      options: Options(headers: _buildHeaders(_token)),
    );
    log('${response.data}');

    return response;
  }

  Future<Response> delete(
      {required String path,
      String? message,
      required Map<String, dynamic>? data,
      String? token}) async {
    log('$data');
    // final storage = await SecureStorage();
    final _token = '';
    // await storage.getUserToken();
    //  final _token = await SecureStorage().getUserToken();
    final response = await _dio.delete(
      path,
      data: data,
      options: Options(headers: _buildHeaders(_token)),
    );
    log('${response.data}');

    return response;
  }
}

Map<String, dynamic> _buildHeaders(String? token) {
  final headers = <String, dynamic>{};
  if (token != null && token.isNotEmpty) {
    headers['Authorization'] = 'Bearer $token';
  }
  return headers;
}

final apiServiceProvider = Provider((ref) => ApiService());
