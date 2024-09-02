import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/reset_password/data/model/reset_password_request.dart';
import 'package:hts_plus/presentation/features/reset_password/data/respository/reset_password_repository.dart';
import 'package:hts_plus/presentation/features/reset_password/presentation/notifier/reset_password_state.dart';

class ResetPasswordNotifier
    extends AutoDisposeNotifier<ResetPasswordNotifierState> {
  ResetPasswordNotifier();
  late final ResetPasswordRepository _resetPasswordRepository;
  @override
  ResetPasswordNotifierState build() {
    _resetPasswordRepository = ref.read(resetPasswordRepositoryProvider);
    return ResetPasswordNotifierState.initial();
  }

  Future<void> resetPassword({
    required ResetPasswordRequest data,
    required void Function(String error) onError,
    required void Function() onSuccess,
  }) async {
    try {
      state = state.copyWith(resetPasswordState: LoadState.loading);
      final success = await _resetPasswordRepository.resetPassword(
        code: data.code,
        password: data.password,
        confirmPassword: data.confirmPassword,
      );

      if (success.success == Status.error) {
        if (success.error.isNotEmpty) {
          throw success.error.map((e) => e.message);
        } else {
          throw success.message ?? 'Validation Error';
        }
      }

      state = state.copyWith(resetPasswordState: LoadState.idle);
      onSuccess();
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(resetPasswordState: LoadState.idle);
    }
  }
}

final resetPasswordNotifier = NotifierProvider.autoDispose<
    ResetPasswordNotifier, ResetPasswordNotifierState>(
  ResetPasswordNotifier.new,
);
