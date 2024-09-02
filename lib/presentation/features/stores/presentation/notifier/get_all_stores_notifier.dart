import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/stores/data/repository/get_all_stores_repository.dart';
import 'package:hts_plus/presentation/features/stores/presentation/notifier/get_all_stores_state.dart';

class GetAllStoresNotifier extends AutoDisposeNotifier<GetAllStoresState> {
  GetAllStoresNotifier();
  late final GetAllStoresRepository _getAllStoresRepository;
  @override
  GetAllStoresState build() {
    _getAllStoresRepository = ref.read(getAllStoresRepositoryProvider);
    return GetAllStoresState.initial();
  }

  Future<void> getAllStores() async {
    try {
      state = state.copyWith(loadState: LoadState.loading);
      final success = await _getAllStoresRepository.getAllStores();

      if (success.data == Status.error) {
        // if (success.error.isNotEmpty) {
        //throw success.error.map((e) => e.email);
        // } else {
        throw success.message ?? 'Validation Error';
        // }
      }

      state = state.copyWith(
          loadState: LoadState.success, getAllStoresData: success.data);
      //  onSuccess();
    } catch (e) {
      //  onError(e.toString());
      state = state.copyWith(loadState: LoadState.idle);
    }
  }
}

final getAllStoresNotifier =
    NotifierProvider.autoDispose<GetAllStoresNotifier, GetAllStoresState>(
  GetAllStoresNotifier.new,
);
