import 'package:hts_plus/core/utils/enums.dart';

class DeleteCartState {
  DeleteCartState({
    required this.deleteCartState,
  });

  final LoadState deleteCartState;

  factory DeleteCartState.initial() {
    return DeleteCartState(
      deleteCartState: LoadState.idle,
    );
  }
  DeleteCartState copyWith({
    LoadState? deleteCartState,
  }) {
    return DeleteCartState(
      deleteCartState: deleteCartState ?? this.deleteCartState,
    );
  }
}
