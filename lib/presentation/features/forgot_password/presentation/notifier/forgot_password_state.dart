import 'package:hts_plus/core/utils/enums.dart';

class ForgotPasswordNotifierState {
  ForgotPasswordNotifierState({
    required this.forgotPasswordState,
    required this.inputValid,
  });
  final bool inputValid;
  final LoadState forgotPasswordState;

  factory ForgotPasswordNotifierState.initial() {
    return ForgotPasswordNotifierState(
      inputValid: false,
      forgotPasswordState: LoadState.idle,
    );
  }
  ForgotPasswordNotifierState copyWith({
    LoadState? forgotPasswordState,
    bool? inputValid,
  }) {
    return ForgotPasswordNotifierState(
      inputValid: inputValid ?? this.inputValid,
      forgotPasswordState: forgotPasswordState ?? this.forgotPasswordState,
    );
  }
}
