import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/constants/app_constants.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/database/database.dart';
import 'package:hts_plus/core/services/app_service.dart';
import 'package:hts_plus/domain/model/app_response_model.dart';

class ApplyCouponRepository {
  ApplyCouponRepository(this._apiService);
//  final RestClient _restClient;
  final ApiService _apiService;
  String? _token;

  Future<AppResponseModel> forgotPassword({required String email}) async {
    try {
      final response = await _apiService.post(
        path: AppConstants.forgotPassword,
        data: {"email": email},
      );
      final data = AppResponseModel.fromJson(response.data);

      final storage = await SecureStorage();
      await storage.saveResetPasswordToken(response.data['data']['token']);
      await storage.saveUserEmail(response.data['data']['email']);
      await storage.saveUserFirstName(response.data['data']['firstName']);
      await storage.saveUserForgotPasswordCode(response.data['data']['code']);

      _token = await storage.getUserToken();
      return data;
    } on DioException catch (e) {
      return ExceptionHandler.handleError(e);
    }
  }

  String? get token => _token;
}

final forgotPasswordRepositoryProvider = Provider<ApplyCouponRepository>(
  (ref) => ApplyCouponRepository(
    ref.read(apiServiceProvider),
  ),
);
