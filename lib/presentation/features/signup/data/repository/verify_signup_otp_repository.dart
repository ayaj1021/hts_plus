
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/constants/app_constants.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/services/app_service.dart';
import 'package:hts_plus/domain/model/app_response_model.dart';

class VerifySignUpOtpRepository {
  final ApiService _apiService;
  VerifySignUpOtpRepository(this._apiService);
  Future<AppResponseModel> verifySignUpOtp({required String otp}) async {
    try {
      final response = await _apiService.patch(
        path: AppConstants.verifyEmail(otp),
        data: {"token": otp},
      );
      debugPrint("${response.data}");
     
      final data = AppResponseModel.fromJson(response.data);
      return data;
    } on DioException catch (e) {
      return ExceptionHandler.handleError(e);
    }
  }
}

final verifySignUpOtpRepositoryProvider = Provider<VerifySignUpOtpRepository>(
  (ref) => VerifySignUpOtpRepository(
    ref.read(apiServiceProvider),
  ),
);
