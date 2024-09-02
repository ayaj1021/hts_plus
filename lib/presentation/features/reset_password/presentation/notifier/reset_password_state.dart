import 'package:hts_plus/core/utils/enums.dart';

class ResetPasswordNotifierState {
  ResetPasswordNotifierState({
    required this.resetPasswordState,
    required this.inputValid,
  });
  final bool inputValid;
  final LoadState resetPasswordState;

  factory ResetPasswordNotifierState.initial() {
    return ResetPasswordNotifierState(
      inputValid: false,
      resetPasswordState: LoadState.idle,
    );
  }
  ResetPasswordNotifierState copyWith({
    LoadState? resetPasswordState,
    bool? inputValid,
  }) {
    return ResetPasswordNotifierState(
      inputValid: inputValid ?? this.inputValid,
      resetPasswordState: resetPasswordState ?? this.resetPasswordState,
    );
  }
}
