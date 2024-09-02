import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/categories/data/model/get_all_categories_model.dart';

class GetAllCategoryState {
  final bool isLoading;
  final bool isAuthenticated;
  final String? error;
  final String? message;
  final LoadState getCategoryState;
  final List<GetAllCategoriesData> getAllCategoryData;

  GetAllCategoryState({
    required this.isLoading,
    required this.isAuthenticated,
    this.error,
    this.message,
    required this.getCategoryState,
    required this.getAllCategoryData,
  });

  factory GetAllCategoryState.initial() {
    return GetAllCategoryState(
      isLoading: false,
      isAuthenticated: false,
      error: null,
      message: '',
      getCategoryState: LoadState.loading,
      getAllCategoryData: [],
    );
  }

  GetAllCategoryState copyWith({
    bool? isLoading,
    bool? isAuthenticated,
    String? error,
    String? message,
    LoadState? getCategoryState,
    List<GetAllCategoriesData>? getAllCategoryData,
  }) {
    return GetAllCategoryState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      error: message,
      getCategoryState: getCategoryState ?? this.getCategoryState,
      getAllCategoryData: getAllCategoryData ?? this.getAllCategoryData,
    );
  }
}
