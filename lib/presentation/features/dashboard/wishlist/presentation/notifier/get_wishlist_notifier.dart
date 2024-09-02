import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/dashboard/wishlist/data/repository/get_wishlist_repository.dart';
import 'package:hts_plus/presentation/features/dashboard/wishlist/presentation/notifier/get_wishlist_state.dart';

class GetWishListNotifier extends AutoDisposeNotifier<GetWishListState> {
  GetWishListNotifier();
  late final GetWishListRepository _getWishListRepository;
  @override
  GetWishListState build() {
    _getWishListRepository = ref.read(getWishListRepositoryProvider);
    return GetWishListState.initial();
  }

  Future<void> getWishList() async {
    try {
      state = state.copyWith(loadState: LoadState.loading);
      final success = await _getWishListRepository.getWishList();

      if (success.data == Status.error) {
        // if (success.error.isNotEmpty) {
        //throw success.error.map((e) => e.email);
        // } else {
        throw success.message ?? 'Validation Error';
        // }
      }

      state = state.copyWith(
          loadState: LoadState.success, getWishListData: success.data);
    } catch (e) {
      state = state.copyWith(loadState: LoadState.idle);
    }
  }
}

final getWishListNotifier =
    NotifierProvider.autoDispose<GetWishListNotifier, GetWishListState>(
  GetWishListNotifier.new,
);
