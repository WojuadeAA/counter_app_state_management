import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataClass {
  int counter;
  int age;
  bool greaterThanFive;
  DataClass(this.counter, this.age, this.greaterThanFive);
}

class CounterStateNotifier extends StateNotifier<int> {
  CounterStateNotifier() : super(0);

  incrementFunction() {
    // state = '45';
    state = state + 1;
  }

  decrementFunction() {
    state = state - 1;
  }

  refreshFunction() {
    state = 0;
  }
}

final counterStateNotifierProvider =
    StateNotifierProvider<CounterStateNotifier, int>(
        (ref) => CounterStateNotifier());
