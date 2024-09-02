import 'package:flutter_riverpod/flutter_riverpod.dart';

final quantityProvider = StateProvider<int>((ref) => 1);

class ItemQuantityNotifier extends StateNotifier<Map<String, int>> {
  ItemQuantityNotifier() : super({});

  void increaseQuantity(String itemId) {
    state = {
      ...state,
      itemId: (state[itemId] ?? 1) + 1,
    };
  }

   void decreaseQuantity(String itemId) {
    final currentQuantity = state[itemId] ?? 1;
    if (currentQuantity > 1) {
      state = {
        ...state,
        itemId: currentQuantity - 1,
      };
    }
  }

  int getQuantity(String itemId) {
    return state[itemId] ?? 1;
  }
}

final itemQuantityProvider =
    StateNotifierProvider<ItemQuantityNotifier, Map<String, int>>(
  (ref) => ItemQuantityNotifier(),
);
