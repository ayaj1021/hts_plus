import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/data/remote_data_source/rest_client.dart';
import 'package:hts_plus/domain/model/app_response_model.dart';
import 'package:hts_plus/presentation/features/signup/data/model/sign_up_request.dart';

class SignUpRepository {
  SignUpRepository(this._restClient);
  final RestClient _restClient;
  Future<AppResponseModel> signUp(SignUpRequest request) async {
    try {
      return await _restClient.signUp(request);
    } on DioException catch (e) {
      return ExceptionHandler.handleError(e);
    }
  }
}

final signUpRepositoryProvider = Provider<SignUpRepository>(
  (ref) => SignUpRepository(
    ref.read(restClientProvider),
  ),
);
