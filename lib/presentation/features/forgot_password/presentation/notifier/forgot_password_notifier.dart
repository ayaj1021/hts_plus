import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/forgot_password/data/model/forgot_password_request.dart';
import 'package:hts_plus/presentation/features/forgot_password/data/repository/forgot_password_repository.dart';
import 'package:hts_plus/presentation/features/forgot_password/presentation/notifier/forgot_password_state.dart';


class ForgotPasswordNotifier
    extends AutoDisposeNotifier<ForgotPasswordNotifierState> {
  ForgotPasswordNotifier();
  late final ApplyCouponRepository _forgotPasswordRepository;
  @override
  ForgotPasswordNotifierState build() {
    _forgotPasswordRepository = ref.read(forgotPasswordRepositoryProvider);
    return ForgotPasswordNotifierState.initial();
  }

  Future<void> forgotPassword({
    required ForgotPasswordRequest data,
    required void Function(String error) onError,
    required void Function() onSuccess,
  }) async {
    try {
      state = state.copyWith(forgotPasswordState: LoadState.loading);
      final success = await _forgotPasswordRepository.forgotPassword(
        email: data.email,
      );

      if (success.success == Status.error) {
        if (success.error.isNotEmpty) {
          throw success.error.map((e) => e.message);
        } else {
          throw success.message ?? 'Validation Error';
        }
      }

      state = state.copyWith(forgotPasswordState: LoadState.idle);
      onSuccess();
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(forgotPasswordState: LoadState.idle);
    }
  }
}

final forgotPasswordNotifier =
    NotifierProvider.autoDispose<ForgotPasswordNotifier, ForgotPasswordNotifierState>(
  ForgotPasswordNotifier.new,
);
