import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/checkout/data/model/check_out_request.dart';
import 'package:hts_plus/presentation/features/checkout/data/repository/check_out_repository.dart';
import 'package:hts_plus/presentation/features/checkout/presentation/notifier/checkout_state.dart';

class CheckOutNotifier extends AutoDisposeNotifier<CheckOutNotifierState> {
  CheckOutNotifier();
  late final CheckOutRepository _checkOutRepository;
  @override
  CheckOutNotifierState build() {
    _checkOutRepository = ref.read(checkOutRepositoryProvider);
    return CheckOutNotifierState.initial();
  }

  Future<void> checkOut({
    required CheckOutRequest data,
    required void Function(String error) onError,
    required void Function() onSuccess,
  }) async {
    try {
      state = state.copyWith(applyCouponState: LoadState.loading);
      final success = await _checkOutRepository.checkOut(
        productId: data.productId,
        quantity: data.quantity,
        couponCode: data.couponCode,
        reference: data.reference,
        orderNote: data.orderNote,
        paymentType: data.paymentType,
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

final checkOutNotifier =
    NotifierProvider.autoDispose<CheckOutNotifier, CheckOutNotifierState>(
  CheckOutNotifier.new,
);
