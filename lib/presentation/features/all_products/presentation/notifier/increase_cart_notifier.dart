import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter extends StateNotifier<int> {
  Counter() : super(0);

  // Method to increase the counter
  void increment() {
    state++;
  }

  void decrease() {
    state--;
  }
}


final cartIncreaseNotifier

 = StateNotifierProvider<Counter, int>((ref) {
  return Counter();
});


final cartStateProvider = StateProvider<bool>((ref) {
  return false;
});
