import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/checkout/data/model/get_cart_total_model.dart';

class ApplyCouponNotifierState {
  ApplyCouponNotifierState(
      {required this.applyCouponState,
      required this.inputValid,
      this.getCartTotalData});
  final bool inputValid;
  final LoadState applyCouponState;
  final GetCartTotalData? getCartTotalData;

  factory ApplyCouponNotifierState.initial() {
    return ApplyCouponNotifierState(
      inputValid: false,
      applyCouponState: LoadState.idle,
    );
  }
  ApplyCouponNotifierState copyWith({
    LoadState? applyCouponState,
    bool? inputValid,
    GetCartTotalData? getCartTotalData,
  }) {
    return ApplyCouponNotifierState(
      inputValid: inputValid ?? this.inputValid,
      applyCouponState: applyCouponState ?? this.applyCouponState,
      getCartTotalData: getCartTotalData ?? getCartTotalData,
    );
  }
}
