import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/cart/data/repository/delete_cart_repository.dart';
import 'package:hts_plus/presentation/features/cart/presentation/notifier/delete_cart_state.dart';

class DeleteCartNotifier extends AutoDisposeNotifier<DeleteCartState> {
  DeleteCartNotifier();
  late final DeleteCartRepository _deleteCartRepository;
  @override
  DeleteCartState build() {
    _deleteCartRepository = ref.read(deleteCartRepositoryProvider);
    return DeleteCartState.initial();
  }

  Future<void> deleteCart({
    required int productId,
 
    required void Function(String error) onError,
    required void Function() onSuccess,
  }) async {
    try {
      state = state.copyWith(deleteCartState: LoadState.loading);
      final success =
          await _deleteCartRepository.deleteCart(productId: productId);

      if (success.success == Status.error) {
        if (success.error.isNotEmpty) {
          throw success.error.map((e) => e.message);
        } else {
          throw success.message ?? 'Validation Error';
        }
      }

      state = state.copyWith(deleteCartState: LoadState.idle);
      onSuccess();
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(deleteCartState: LoadState.idle);
    }
  }
}

final deleteCartNotifier =
    NotifierProvider.autoDispose<DeleteCartNotifier, DeleteCartState>(
  DeleteCartNotifier.new,
);
