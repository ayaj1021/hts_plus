import 'dart:async';


import 'package:dio/dio.dart';
import 'package:hts_plus/core/config/exception/logger.dart';
import 'package:hts_plus/domain/repository/user_auth_repository.dart';

class HeaderInterCeptor extends Interceptor {
  HeaderInterCeptor({
    required this.dio,
    required this.authRepository,
  });
  final Dio dio;
  final UserAuthRepository authRepository;

  @override
  FutureOr<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    try {
      final token = authRepository.getToken();
      if (token.token?.isNotEmpty ?? false) {
        options.headers['Cookie'] = 'accessToken=${token.token}';
      }
    } catch (e) {
      debugLog(e);
    }
    debugLog('[URL]${options.uri}');
    debugLog('[BODY] ${options.data}');
    debugLog('[METHOD] ${options.method}');
    debugLog('[QUERIES]${options.queryParameters}');
    debugLog('[HEADERS]${options.headers}');

    handler.next(options);
    return options;
  }

  @override
  FutureOr<dynamic> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // if (err.response != null && err.response!.statusCode == 401) {
    //   ref.read(logoutProvider.notifier).state = ActivityStatus.loggedOut;
    //   return;
    // }
    debugLog('[ERROR] ${err.requestOptions.uri}'); 
    debugLog('[ERROR] ${err.response}');
    handler.next(err);
    return err;
  }

  @override
  FutureOr<dynamic> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    debugLog(
      '[RESPONSE FROM ${response.requestOptions.path}]: ${response.data}',
    );
    handler.next(response);
    return response;
  }
}

// Future<void> _refreshToken(
//   DioException error,
//   ErrorInterceptorHandler handler,
//   Dio dio,
//   UserRepository userRepository,
//   Ref ref,
// ) async {
//   final refreshToken = userRepository.getRefreshToken();
//   try {
//     final r = await Dio().post<Response<Map<String, dynamic>?>>(
//       '${AuthStrings.baseUrl}/auth/refresh-token',
//       data: {
//         'refreshToken': refreshToken,
//       },
//     );
//     if (r.statusCode == 200) {
//       userRepository.saveToken(r.data['newAccessToken']);
//     }
//     return handleError(handler, error, dio);
//   } on DioException catch (_) {
//     // ref.read(homeNotifier.notifier).logout();
//     return;
//   }
// }

Future<void> handleError(
  ErrorInterceptorHandler handler,
  DioException err,
  Dio dio,
) async {
  final opts = Options(
    method: err.requestOptions.method,
    headers: err.requestOptions.headers,
  );
  final cloneReq = await dio.request<Map<String, dynamic>?>(
    err.requestOptions.path,
    options: opts,
    data: err.requestOptions.data,
    queryParameters: err.requestOptions.queryParameters,
  );

  return handler.resolve(cloneReq);
}
