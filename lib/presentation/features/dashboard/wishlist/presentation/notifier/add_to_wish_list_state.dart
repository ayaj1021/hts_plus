import 'package:hts_plus/core/utils/enums.dart';

class AddToWishListState {
  AddToWishListState({
    required this.addToWishListState,
    required this.isAdded,
  });

  final LoadState addToWishListState;
  final bool isAdded;

  factory AddToWishListState.initial() {
    return AddToWishListState(
      addToWishListState: LoadState.idle,
      isAdded: false,
    );
  }
  AddToWishListState copyWith({
    LoadState? addToWishListState,
    bool? isAdded,
  }) {
    return AddToWishListState(
      addToWishListState: addToWishListState ?? this.addToWishListState,
      isAdded: isAdded ?? this.isAdded,
    );
  }
}
