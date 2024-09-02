import 'package:hts_plus/core/utils/enums.dart';

class LoginNotifierState {
  LoginNotifierState({
    required this.loginState,
    required this.inputValid,
  });
  final bool inputValid;
  final LoadState loginState;

  factory LoginNotifierState.initial() {
    return LoginNotifierState(
      inputValid: false,
      loginState: LoadState.idle,
    );
  }
  LoginNotifierState copyWith({
    LoadState? loginState,
    bool? inputValid,
  }) {
    return LoginNotifierState(
      inputValid: inputValid ?? this.inputValid,
      loginState: loginState ?? this.loginState,
    );
  }
}
