import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/utils/enums.dart';

import 'package:hts_plus/presentation/features/product_description_screen/data/repository/add_to_cart_repository.dart';
import 'package:hts_plus/presentation/features/product_description_screen/presentation/notifer/add_to_cart_state.dart';

class AddToCartNotifier extends AutoDisposeNotifier<AddToCartState> {
  AddToCartNotifier();
  late final AddToCartRepository _addToCartRepository;
  @override
  AddToCartState build() {
    _addToCartRepository = ref.read(addToCartRepositoryProvider);
    return AddToCartState.initial();
  }

  Future<void> addToCart({
    required int productId,
    required int quantity,
    required void Function(String error) onError,
    required void Function() onSuccess,
  }) async {
    try {
      state = state.copyWith(addToCartState: LoadState.loading);
      final success = await _addToCartRepository.addToCart(
          productId: productId, quantity: quantity);

      if (success.success == Status.error) {
        if (success.error.isNotEmpty) {
          throw success.error.map((e) => e.message);
        } else {
          throw success.message ?? 'Validation Error';
        }
      }

      state = state.copyWith(addToCartState: LoadState.idle);
      onSuccess();
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(addToCartState: LoadState.idle);
    }
  }
}

final addToCartNotifier =
    NotifierProvider.autoDispose<AddToCartNotifier, AddToCartState>(
  AddToCartNotifier.new,
);
