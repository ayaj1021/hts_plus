import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/env/base_env.dart';
import 'package:hts_plus/core/config/env/prod_env.dart';
import 'package:hts_plus/core/config/interceptors/head_interceptor.dart';
import 'package:hts_plus/domain/model/app_response_model.dart';
import 'package:hts_plus/domain/repository/user_auth_repository.dart';
import 'package:hts_plus/presentation/features/login/data/models/login_request.dart';
import 'package:hts_plus/presentation/features/login/data/models/login_response.dart';
import 'package:hts_plus/presentation/features/signup/data/model/sign_up_request.dart';
import 'package:hts_plus/presentation/features/signup/data/model/sign_up_response.dart';
import 'package:hts_plus/presentation/features/signup/data/model/verify_sign_up_otp_request.dart';
import 'package:hts_plus/presentation/features/signup/data/model/verify_sign_up_otp_response.dart';
import 'package:hts_plus/presentation/features/stores/data/model/get_all_stores_model.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/auth/signup')
  Future<AppResponseModel<SignUpResponse>> signUp(
    @Body() SignUpRequest signUpRequest,
  );

  @POST('/auth/login')
  Future<AppResponseModel<LoginResponse>> login(
    @Body() LoginRequest loginRequest,
  );

  @POST('auth/verify-email?token=971691')
  Future<AppResponseModel<VerifySignUpOtpResponse>> verifySignUpOtp(
      @Body() VerifySignUpOtpRequest verifySignUpOtpRequest);

  @GET('/admin/partner-store')
  Future<AppResponseModel<GetAllStoresData>> getAllStores(
      // @Path() String providerId,
      );
}

ProviderFamily<Dio, BaseEnv> _dio = Provider.family<Dio, BaseEnv>(
  (ref, env) {
    final dio = Dio();
    dio.options.baseUrl = 'https://hts-backend-main.onrender.com/v1';
    dio.options.headers = {
      'Content-Type': 'application/json',
      // 'accept': 'application/json',
    };

    dio.interceptors.add(
      HeaderInterCeptor(
        dio: dio,
        authRepository: ref.read(userAuthRepositoryProvider),
        // onTokenExpired: () {
        //   ref.read(logoutProvider.notifier).state = ActivityStatus.loggedOut;
        // },
      ),
    );
    return dio;
  },
);

final restClientProvider = Provider((_) {
  final env = switch (F.appFlavor) {
    Flavor.prod => ProdEnv(),
    // Flavor.staging => StagingEnv(),
    // Flavor.dev => DevEnv(),
  };
  return RestClient(_.read(_dio.call(env)));
});
