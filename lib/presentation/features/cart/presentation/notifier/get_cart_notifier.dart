import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/cart/data/repository/get_cart_repository.dart';
import 'package:hts_plus/presentation/features/cart/presentation/notifier/get_cart_state.dart';

class GetCartNotifier extends AutoDisposeNotifier<GetCartState> {
  GetCartNotifier();
  late final GetAllCartRepository _getAllCartRepository;
  @override
  GetCartState build() {
    _getAllCartRepository = ref.read(getCartRepositoryProvider);
    return GetCartState.initial();
  }

  Future<void> getCart() async {
    try {
      state = state.copyWith(loadState: LoadState.loading);
      final success = await _getAllCartRepository.getCart();

      if (success.data == Status.error) {
        // if (success.error.isNotEmpty) {
        //throw success.error.map((e) => e.email);
        // } else {
        throw success.message ?? 'Validation Error';
        // }
      }

      state = state.copyWith(
          loadState: LoadState.success, getCartData: success.data);
    } catch (e) {
      state = state.copyWith(loadState: LoadState.idle);
    }
  }
}

final getCartNotifier =
    NotifierProvider.autoDispose<GetCartNotifier, GetCartState>(
  GetCartNotifier.new,
);
