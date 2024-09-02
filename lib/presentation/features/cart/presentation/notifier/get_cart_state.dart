import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/cart/data/model/get_cart_model.dart';

class GetCartState {
  final bool isLoading;
  final bool isAuthenticated;
  final String? error;
  final String? message;
  final LoadState loadState;
  final List<GetCartData> getCartData;

  GetCartState({
    required this.isLoading,
    required this.isAuthenticated,
    this.error,
    this.message,
    required this.loadState,
    required this.getCartData,
  });

  factory GetCartState.initial() {
    return GetCartState(
      isLoading: false,
      isAuthenticated: false,
      error: null,
      message: '',
      loadState: LoadState.loading,
      getCartData: [],
    );
  }

  GetCartState copyWith({
    bool? isLoading,
    bool? isAuthenticated,
    String? error,
    String? message,
    LoadState? loadState,
    List<GetCartData>? getCartData,
  }) {
    return GetCartState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      error: message,
      loadState: loadState ?? this.loadState,
      getCartData: getCartData ?? this.getCartData,
    );
  }
}
