import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/config/exception/logger.dart';
import 'package:hts_plus/core/database/database.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/domain/model/auth_response.dart';
import 'package:hts_plus/domain/repository/user_auth_repository.dart';
import 'package:hts_plus/domain/repository/user_repository.dart';
import 'package:hts_plus/presentation/features/login/data/models/login_response.dart';
import 'package:hts_plus/presentation/features/signup/data/model/sign_up_request.dart';
import 'package:hts_plus/presentation/features/signup/data/model/sign_up_response.dart';
import 'package:hts_plus/presentation/features/signup/data/repository/sign_up_repository.dart';
import 'package:hts_plus/presentation/features/signup/presentation/notifier/sign_up_state.dart';

class SignUpNotifier extends AutoDisposeNotifier<SignUpNotifierState> {
  SignUpNotifier();

  late SignUpRepository _registerRepository;
  late UserAuthRepository _userAuthRepository;
  late UserRepository _userRepository;
  @override
  SignUpNotifierState build() {
    _registerRepository = ref.read(signUpRepositoryProvider);
    _userAuthRepository = ref.read(userAuthRepositoryProvider);
    return SignUpNotifierState.initial();
  }

  void allInputValid({
    required bool emailValid,
    required bool passwordValid,
    required bool nameValid,
  }) {
    state =
        state.copyWith(inputValid: emailValid && passwordValid && nameValid);
  }

  Future<void> signUp({
    required SignUpRequest data,
    required void Function(String error) onError,
    required void Function() onSuccess,
  }) async {
    state = state.copyWith(registerState: LoadState.loading);

    try {
      final success = await _registerRepository.signUp(data);
      debugLog(data);
      await SecureStorage().saveUserEmail('${data.email}');
      if (success.success == Status.error) {
         onError(success.message.toString());
        if (success.error.isNotEmpty) {
        throw success.error.map((e) => e.email);
        } else {
          throw success.message ?? 'Validation Error';
        }
      }

      state = state.copyWith(registerState: LoadState.idle);
      onSuccess();
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(registerState: LoadState.idle);
    }
  }

  Future<void> saveUser(LoginResponse res) async {
    final user = HTSUser(
      email: res.email ?? '',
      firstName: res.firstName ?? '',
      lastName: res.lastName ?? '',
    );
    await _userRepository.updateUser(user);
  }

  Future<void> saveToken(Tokens token) async {
    await _userAuthRepository.saveToken(token);
  }
}

final registerNotifier =
    NotifierProvider.autoDispose<SignUpNotifier, SignUpNotifierState>(
  SignUpNotifier.new,
);
