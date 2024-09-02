import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/dashboard/wishlist/data/model/wishlist_model.dart';

class GetWishListState {
  final bool isLoading;
  final bool isAuthenticated;
  final String? error;
  final String? message;
  final LoadState loadState;
  final List<WishListModelData> getWishListData;

  GetWishListState({
    required this.isLoading,
    required this.isAuthenticated,
    this.error,
    this.message,
    required this.loadState,
    required this.getWishListData,
  });

  factory GetWishListState.initial() {
    return GetWishListState(
      isLoading: false,
      isAuthenticated: false,
      error: null,
      message: '',
      loadState: LoadState.loading,
      getWishListData: [],
    );
  }

  GetWishListState copyWith({
    bool? isLoading,
    bool? isAuthenticated,
    String? error,
    String? message,
    LoadState? loadState,
    List<WishListModelData>? getWishListData,
  }) {
    return GetWishListState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      error: message,
      loadState: loadState ?? this.loadState,
      getWishListData: getWishListData ?? this.getWishListData,
    );
  }
}
