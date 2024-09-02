import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/database/database.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/domain/model/auth_response.dart';
import 'package:hts_plus/presentation/features/login/data/models/login_request.dart';

import 'package:hts_plus/presentation/features/login/data/repository/login_repository.dart';
import 'package:hts_plus/presentation/features/login/presentation/notifier/login_state.dart';

class LoginNotifier extends AutoDisposeNotifier<LoginNotifierState> {
  LoginNotifier();
  late final LoginRepository _loginRepository;
  @override
  LoginNotifierState build() {
    _loginRepository = ref.read(loginRepositoryProvider);
    return LoginNotifierState.initial();
  }

  Future<void> login({
    required LoginRequest data,
    required void Function(String error) onError,
    required void Function() onSuccess,
  }) async {
    try {
      state = state.copyWith(loginState: LoadState.loading);
      final success = await _loginRepository.login(
        email: data.email,
        password: data.password,
      );

      if (success.success == Status.error) {
        if (success.error.isNotEmpty) {
          throw success.error.map((e) => e.email);
        } else {
          throw success.message ?? 'Validation Error';
        }
      }

      state = state.copyWith(loginState: LoadState.idle);
      onSuccess();
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(loginState: LoadState.idle);
    }
  }

  // Future<void> _saveUser(LoginResponse res) async {
  //   final user = DSUser(
  //     email: res.email ?? '',
  //     firstName: res.firstName ?? '',
  //     lastName: res.lastName ?? '',
  //   );
  //   await ref.read(userRepositoryProvider).updateUser(user);
  // }

  Future<void> saveToken(Tokens token) async {
    await SecureStorage().saveUserToken('${token.token}');
    //ref.read(userAuthRepositoryProvider).saveToken(token);
  }
}

final loginNotifier =
    NotifierProvider.autoDispose<LoginNotifier, LoginNotifierState>(
  LoginNotifier.new,
);
