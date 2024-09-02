
import 'package:hts_plus/core/utils/enums.dart';

class SignUpNotifierState {
  SignUpNotifierState({
    required this.inputValid,
    required this.registerState,
  });
  factory SignUpNotifierState.initial() {
    return SignUpNotifierState(
      inputValid: false,
      registerState: LoadState.idle,
    );
  }
  final bool inputValid; 
  final LoadState registerState;
  
  SignUpNotifierState copyWith({
    bool? inputValid,
    LoadState? registerState,
  }) {
    return SignUpNotifierState(
      inputValid: inputValid ?? this.inputValid,
      registerState: registerState ?? this.registerState,
    );
  }
}
