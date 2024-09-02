import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/store_products/data/model/get_all_store_products_model.dart';

class GetAllStoresProductsState {
  final bool isLoading;
  final bool isAuthenticated;
  final String? error;
  final String? message;
  final LoadState loadState;
  final List<GetAllStoreProductsData> getAllStoresProductsData;

  GetAllStoresProductsState({
    required this.isLoading,
    required this.isAuthenticated,
    this.error,
    this.message,
    required this.loadState,
    required this.getAllStoresProductsData,
  });

  factory GetAllStoresProductsState.initial() {
    return GetAllStoresProductsState(
      isLoading: false,
      isAuthenticated: false,
      error: null,
      message: '',
      loadState: LoadState.loading,
      getAllStoresProductsData: [],
    );
  }

  GetAllStoresProductsState copyWith({
    bool? isLoading,
    bool? isAuthenticated,
    String? error,
    String? message,
    LoadState? loadState,
    List<GetAllStoreProductsData>? getAllStoresProductsData,
  }) {
    return GetAllStoresProductsState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      error: message,
      loadState: loadState ?? this.loadState,
      getAllStoresProductsData:
          getAllStoresProductsData ?? this.getAllStoresProductsData,
    );
  }
}
