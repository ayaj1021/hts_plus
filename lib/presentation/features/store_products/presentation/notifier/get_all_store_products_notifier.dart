import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/store_products/data/repository/get_all_store_products_repository.dart';
import 'package:hts_plus/presentation/features/store_products/presentation/notifier/get_all_store_products_state.dart';

class GetAllStoreProductsNotifier
    extends AutoDisposeNotifier<GetAllStoresProductsState> {
  GetAllStoreProductsNotifier();
  late final GetAllStoreProductsRepository _getAllStoreProductsRepository;
  @override
  GetAllStoresProductsState build() {
    _getAllStoreProductsRepository =
        ref.read(getAllStoreProductsRepositoryProvider);
    return GetAllStoresProductsState.initial();
  }

  Future<void> getAllStoreProducts({required String storeId}) async {
    try {
      state = state.copyWith(loadState: LoadState.loading);
      final success = await _getAllStoreProductsRepository.getAllStoreProducts(
          storeId: storeId);

      if (success.data == Status.error) {
        // if (success.error.isNotEmpty) {
        //throw success.error.map((e) => e.email);
        // } else {
        throw success.message ?? 'Validation Error';
        // }
      }

      state = state.copyWith(
          loadState: LoadState.success, getAllStoresProductsData: success.data);
    } catch (e) {
      state = state.copyWith(loadState: LoadState.idle);
    }
  }
}

final getAllStoreProductsNotifier = NotifierProvider.autoDispose<
    GetAllStoreProductsNotifier, GetAllStoresProductsState>(
  GetAllStoreProductsNotifier.new,
);
