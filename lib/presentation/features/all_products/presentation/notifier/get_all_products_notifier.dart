import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/all_products/data/repository/get_all_products_repository.dart';
import 'package:hts_plus/presentation/features/all_products/presentation/notifier/get_all_products_state.dart';

class GetAllProductsNotifier extends AutoDisposeNotifier<GetAllProductsState> {
  GetAllProductsNotifier();
  late final GetAllProductsRepository _getAllProductsRepository;
  @override
  GetAllProductsState build() {
    _getAllProductsRepository = ref.read(getAllProductsRepositoryProvider);
    return GetAllProductsState.initial();
  }

  Future<void> getAllProducts() async {
    try {
      state = state.copyWith(loadState: LoadState.loading);
      final success = await _getAllProductsRepository.getAllProducts();

      if (success.data == Status.error) {
        // if (success.error.isNotEmpty) {
        //throw success.error.map((e) => e.email);
        // } else {
        throw success.message ?? 'Validation Error';
        // }
      }

      state = state.copyWith(
          loadState: LoadState.success, getAllProductsData: success.data);
    } catch (e) {
      state = state.copyWith(loadState: LoadState.idle);
    }
  }
}

final getAllProductsNotifier =
    NotifierProvider.autoDispose<GetAllProductsNotifier, GetAllProductsState>(
  GetAllProductsNotifier.new,
);
