import 'package:hts_plus/core/utils/enums.dart';

class CheckOutNotifierState {
  CheckOutNotifierState({
    required this.applyCouponState,
    required this.inputValid,
  });
  final bool inputValid;
  final LoadState applyCouponState;

  factory CheckOutNotifierState.initial() {
    return CheckOutNotifierState(
      inputValid: false,
      applyCouponState: LoadState.idle,
    );
  }
  CheckOutNotifierState copyWith({
    LoadState? applyCouponState,
    bool? inputValid,
  }) {
    return CheckOutNotifierState(
      inputValid: inputValid ?? this.inputValid,
      applyCouponState: applyCouponState ?? this.applyCouponState,
    );
  }
}
