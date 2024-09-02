import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/dashboard/wishlist/data/repository/add_to_wishlist_repository.dart';
import 'package:hts_plus/presentation/features/dashboard/wishlist/presentation/notifier/add_to_wish_list_state.dart';

class AddToWishListNotifier extends AutoDisposeNotifier<AddToWishListState> {
  AddToWishListNotifier();
  late final AddToWishListRepository _addToWishListRepository;
  @override
  AddToWishListState build() {
    _addToWishListRepository = ref.read(addToWishListRepositoryProvider);
    return AddToWishListState.initial();
  }

  Future<void> addToWishList({
    required int productId,
    required int quantity,
    required void Function(String error) onError,
    required void Function() onSuccess,
  }) async {
    try {
      state = state.copyWith(addToWishListState: LoadState.loading);
      final success = await _addToWishListRepository.addToWishList(
          productId: productId, quantity: quantity);

      if (success.success == Status.error) {
        if (success.error.isNotEmpty) {
          throw success.error.map((e) => e.message);
        } else {
          throw success.message ?? 'Validation Error';
        }
      }

      state = state.copyWith(addToWishListState: LoadState.idle, isAdded: true);
      onSuccess();
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(addToWishListState: LoadState.idle);
    }
  }
}

final addToWishListNotifier =
    NotifierProvider.autoDispose<AddToWishListNotifier, AddToWishListState>(
  AddToWishListNotifier.new,
);
