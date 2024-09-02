import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/product_description_screen/data/repository/get_product_by_id_repository.dart';
import 'package:hts_plus/presentation/features/product_description_screen/presentation/notifer/get_product_by_id_state.dart';

class GetProductsByIDNotifier
    extends AutoDisposeNotifier<GetProductsByIdState> {
  GetProductsByIDNotifier();
  late final GetProductsByIdRepository _getProductsByIdRepository;
  @override
  GetProductsByIdState build() {
    _getProductsByIdRepository = ref.read(getProductsByIdRepositoryProvider);
    return GetProductsByIdState.initial();
  }

  Future<void> getProductsById({required String id}) async {
    try {
      state = state.copyWith(loadState: LoadState.loading);
      final success = await _getProductsByIdRepository.getProductsById(id: id);

      if (success.data == Status.error) {
        // if (success.error.isNotEmpty) {
        //throw success.error.map((e) => e.email);
        // } else {
        throw success.message ?? 'Validation Error';
        // }
      }

      state = state.copyWith(
          loadState: LoadState.success, getProductsByIdData: success.data);
    } catch (e) {
      state = state.copyWith(loadState: LoadState.idle);
    }
  }

 
}

final getProductsByIdNotifier =
    NotifierProvider.autoDispose<GetProductsByIDNotifier, GetProductsByIdState>(
  GetProductsByIDNotifier.new,
);
