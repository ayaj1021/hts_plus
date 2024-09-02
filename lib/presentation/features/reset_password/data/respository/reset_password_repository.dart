import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/constants/app_constants.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/database/database.dart';
import 'package:hts_plus/core/services/app_service.dart';
import 'package:hts_plus/domain/model/app_response_model.dart';

class ResetPasswordRepository {
  ResetPasswordRepository(this._apiService);
//  final RestClient _restClient;
  final ApiService _apiService;
  String? _token;

  Future<AppResponseModel> resetPassword({
    required String code,
    required String password,
    required String confirmPassword,
  }) async {
    final storage = await SecureStorage();
    final token = await storage.getResetPasswordToken();
    try {
      final response = await _apiService.post(
        path: AppConstants.resetPassword("$token"),
        data: {
          "code": code,
          "password": password,
          "confirmPassword": confirmPassword
        },
      );
      final data = AppResponseModel.fromJson(response.data);

      return data;
    } on DioException catch (e) {
      return ExceptionHandler.handleError(e);
    }
  }

  String? get token => _token;
}

final resetPasswordRepositoryProvider = Provider<ResetPasswordRepository>(
  (ref) => ResetPasswordRepository(
    ref.read(apiServiceProvider),
  ),
);
