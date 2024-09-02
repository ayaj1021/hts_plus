
import 'package:hts_plus/core/utils/enums.dart';

class VerifySignUpOtpNotifierState {
  VerifySignUpOtpNotifierState({
    required this.inputValid,
    required this.verifySignUpOtpState,
  });
  factory VerifySignUpOtpNotifierState.initial() {
    return VerifySignUpOtpNotifierState(
      inputValid: false,
      verifySignUpOtpState: LoadState.idle,
    );
  }
  final bool inputValid; 
  final LoadState verifySignUpOtpState;
  VerifySignUpOtpNotifierState copyWith({
    bool? inputValid,
    LoadState? verifySignUpOtpState,
  }) {
    return VerifySignUpOtpNotifierState(
      inputValid: inputValid ?? this.inputValid,
      verifySignUpOtpState: verifySignUpOtpState ?? this.verifySignUpOtpState,
    );
  }
}
