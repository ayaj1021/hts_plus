import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/product_description_screen/data/model/get_product_by_id_model.dart';

class GetProductsByIdState {
  final bool isLoading;
  final bool isAuthenticated;
  final String? error;
  final String? message;
  final LoadState loadState;
  final GetProductByIdData getProductsByIdData;

  GetProductsByIdState({
    required this.isLoading,
    required this.isAuthenticated,
    this.error,
    this.message,
    required this.loadState,
    required this.getProductsByIdData,
  });

  factory GetProductsByIdState.initial() {
    return GetProductsByIdState(
      isLoading: false,
      isAuthenticated: false,
      error: null,
      message: '',
      loadState: LoadState.loading,
      getProductsByIdData: GetProductByIdData(),
    );
  }

  GetProductsByIdState copyWith({
    bool? isLoading,
    bool? isAuthenticated,
    String? error,
    String? message,
    LoadState? loadState,
    GetProductByIdData? getProductsByIdData,
  }) {
    return GetProductsByIdState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      error: message,
      loadState: loadState ?? this.loadState,
      getProductsByIdData: getProductsByIdData ?? this.getProductsByIdData,
    );
  }
}
