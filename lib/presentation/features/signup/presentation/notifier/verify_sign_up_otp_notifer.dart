import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/config/exception/logger.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/signup/data/repository/verify_signup_otp_repository.dart';
import 'package:hts_plus/presentation/features/signup/presentation/notifier/verify_sign_up_otp_state.dart';

class VerifySignUpOtpNotifier
    extends AutoDisposeNotifier<VerifySignUpOtpNotifierState> {
  VerifySignUpOtpNotifier();

  late final VerifySignUpOtpRepository _verifySignUpOtpRepository;
  // late UserAuthRepository _userAuthRepository;
  // late UserRepository _userRepository;
  @override
  VerifySignUpOtpNotifierState build() {
    _verifySignUpOtpRepository = ref.read(verifySignUpOtpRepositoryProvider);
    // _userAuthRepository = ref.read(userAuthRepositoryProvider);
    return VerifySignUpOtpNotifierState.initial();
  }

  void allInputValid({
    required bool confirmationCode,
  }) {
    state = state.copyWith(inputValid: confirmationCode);
  }

  Future<void> verifySignUpOtp({
    required String otp,
    required void Function(String error) onError,
    required void Function() onSuccess,
  }) async {
    state = state.copyWith(verifySignUpOtpState: LoadState.loading);

    try {
      final success =
          await _verifySignUpOtpRepository.verifySignUpOtp(otp: otp);
      debugLog(otp);
      // await SecureStorage().saveUserToken('${success.email}');
      if (success.success == Status.error) {
        if (success.error.isNotEmpty) {
        throw success.error.map((e) => e.email);
        } else {
          throw success.message ?? 'Validation Error';
        }
      }

      state = state.copyWith(verifySignUpOtpState: LoadState.idle);
      onSuccess();
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(verifySignUpOtpState: LoadState.idle);
    }
  }

  // Future<void> saveUser(LoginResponse res) async {
  //   final user = HTSUser(
  //     email: res.email ?? '',
  //     firstName: res.firstName ?? '',
  //     lastName: res.lastName ?? '',
  //   );
  //   await _userRepository.updateUser(user);
  // }

  // Future<void> saveToken(Tokens token) async {
  //   await _userAuthRepository.saveToken(token);
  // }
}

final verifySignUpOtpNotifier = NotifierProvider.autoDispose<
    VerifySignUpOtpNotifier, VerifySignUpOtpNotifierState>(
  VerifySignUpOtpNotifier.new,
);
