import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/categories/data/repository/get_all_category_repository.dart';
import 'package:hts_plus/presentation/features/categories/presentation/notifier/get_category_state.dart';

class GetAllCategoryNotifier extends AutoDisposeNotifier<GetAllCategoryState> {
  GetAllCategoryNotifier();
  late final GetAllCategoryRepository _getAllCategoryRepository;
  @override
  GetAllCategoryState build() {
    _getAllCategoryRepository = ref.read(getAllCategoryRepositoryProvider);
    return GetAllCategoryState.initial();
  }

  Future<void> getAllCategory() async {
    try {
      state = state.copyWith(getCategoryState: LoadState.loading);
      final success = await _getAllCategoryRepository.getAllCategory();

      if (success.data == Status.error) {
        // if (success.error.isNotEmpty) {
        //throw success.error.map((e) => e.email);
        // } else {
        throw success.message ?? 'Validation Error';
        // }
      }

      state = state.copyWith(
          getCategoryState: LoadState.success,
          getAllCategoryData: success.data);
    } catch (e) {
      state = state.copyWith(getCategoryState: LoadState.idle);
    }
  }
}

final getAllCategoryNotifier =
    NotifierProvider.autoDispose<GetAllCategoryNotifier, GetAllCategoryState>(
  GetAllCategoryNotifier.new,
);
