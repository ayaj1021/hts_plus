import 'package:hts_plus/core/utils/enums.dart';

class AddToCartState {
  AddToCartState({
    required this.addToCartState,
   
  });
  

  final LoadState addToCartState;

  factory AddToCartState.initial() {
    return AddToCartState(
 
      addToCartState: LoadState.idle,
    );
  }
  AddToCartState copyWith({
    LoadState? addToCartState,
   
  }) {
    return AddToCartState(

      addToCartState: addToCartState ?? this.addToCartState,
    );
  }
}
