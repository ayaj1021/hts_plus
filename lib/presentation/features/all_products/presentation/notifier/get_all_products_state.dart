import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/all_products/data/model/get_all_products_model.dart';

class GetAllProductsState {
  final bool isLoading;
  final bool isAuthenticated;
  final String? error;
  final String? message;
  final LoadState loadState;
  final List<GetAllProductsData> getAllProductsData;

  GetAllProductsState({
    required this.isLoading,
    required this.isAuthenticated,
    this.error,
    this.message,
    required this.loadState,
    required this.getAllProductsData,
  });

  factory GetAllProductsState.initial() {
    return GetAllProductsState(
      isLoading: false,
      isAuthenticated: false,
      error: null,
      message: '',
      loadState: LoadState.loading,
      getAllProductsData: [],
    );
  }

  GetAllProductsState copyWith({
    bool? isLoading,
    bool? isAuthenticated,
    String? error,
    String? message,
    LoadState? loadState,
    List<GetAllProductsData>? getAllProductsData,
  }) {
    return GetAllProductsState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      error: message,
      loadState: loadState ?? this.loadState,
      getAllProductsData: getAllProductsData ?? this.getAllProductsData,
    );
  }
}
