import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/data/remote_data_source/rest_client.dart';
import 'package:hts_plus/domain/model/app_response_model.dart';
import 'package:hts_plus/presentation/features/signup/data/model/verify_sign_up_otp_request.dart';

class VerifySignUpOtpRepository {
  VerifySignUpOtpRepository(this._restClient);
  final RestClient _restClient;
  Future<AppResponseModel> verifySignUpOtp(
      VerifySignUpOtpRequest request) async {
    try {
      return await _restClient.verifySignUpOtp(request);
    } on DioException catch (e) {
      return ExceptionHandler.handleError(e);
    }
  }
}

final verifySignUpOtpRepositoryProvider = Provider<VerifySignUpOtpRepository>(
  (ref) => VerifySignUpOtpRepository(
    ref.read(restClientProvider),
  ),
);
