import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/checkout/data/model/apply_coupon_request.dart';
import 'package:hts_plus/presentation/features/checkout/data/repository/apply_coupon_repository.dart';
import 'package:hts_plus/presentation/features/checkout/presentation/notifier/apply_coupon_state.dart';

class ApplyCouponNotifier
    extends AutoDisposeNotifier<ApplyCouponNotifierState> {
  ApplyCouponNotifier();
  late final ApplyCouponRepository _applyCouponRepository;
  @override
  ApplyCouponNotifierState build() {
    _applyCouponRepository = ref.read(applyCouponRepositoryProvider);
    return ApplyCouponNotifierState.initial();
  }

  Future<void> applyCoupon({
    required ApplyCouponRequest data,
    required void Function(String error) onError,
    required void Function() onSuccess,
  }) async {
    try {
      state = state.copyWith(applyCouponState: LoadState.loading);
      final success = await _applyCouponRepository.applyCoupon(
        productId: data.productId,
        quantity: data.quantity,
        couponCode: data.couponCode,
      );

      if (success.success == Status.error) {
        if (success.error.isNotEmpty) {
          throw success.error.map((e) => e.message);
        } else {
          throw success.message ?? 'Validation Error';
        }
      }

      state = state.copyWith(applyCouponState: LoadState.idle);
      onSuccess();
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(applyCouponState: LoadState.idle);
    }
  }
}

final applyCouponNotifier =
    NotifierProvider.autoDispose<ApplyCouponNotifier, ApplyCouponNotifierState>(
  ApplyCouponNotifier.new,
);
