import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/constants/app_constants.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/database/database.dart';
import 'package:hts_plus/core/services/app_service.dart';
import 'package:hts_plus/domain/model/app_response_model.dart';

class LoginRepository {
  LoginRepository(this._apiService);
//  final RestClient _restClient;
  final ApiService _apiService;
  String? _token;

  Future<AppResponseModel> login(
      {required String email, required String password}) async {
    try {
      final response = await _apiService.post(
        path: AppConstants.login,
        data: {"email": email, "password": password},
      );
      final data = AppResponseModel.fromJson(response.data);

      final storage = await SecureStorage();
      await storage.saveUserToken(response.data['data']['token']);
      await storage.saveUserId(response.data['data']['id']);
      await storage.saveUserEmail(response.data['data']['email']);
      _token = await storage.getUserToken();
      return data;
    } on DioException catch (e) {
      return ExceptionHandler.handleError(e);
    }
  }

  String? get token => _token;
}

final loginRepositoryProvider = Provider<LoginRepository>(
  (ref) => LoginRepository(
    ref.read(apiServiceProvider),
  ),
);
