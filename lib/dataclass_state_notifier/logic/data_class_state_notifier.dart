import 'data_class.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataClassStateNotifier extends StateNotifier<DataClass> {
  DataClassStateNotifier()
      : super(DataClass(
          age: 0,
          counter: 0,
          ageGreaterThanFive: false,
        ));

//   example() {
//     DataClass dataClass1 =
//         DataClass(age: 0, counter: 2, ageGreaterThanFive: false);
//     DataClass dataClass2 =
//         DataClass(age: 0, counter: 2, ageGreaterThanFive: false);

// //plenty codes.....

//     int number1 = 0;
//     int number2 = 0;

//     if (dataClass1 == dataClass2) {
//       print("pay money");
//     } else {
//       print("scam");
//     }
//   }

  incrementCounter() {
    // final currentCounterValue = state.counter;

    state = state.copyWith(counter: state.counter + 1);
  }

  decrementCounter() {
    state = state.copyWith(counter: state.counter - 1);
  }

  decerementAge() {
    final currentAge = state.age;
    if (currentAge < 5) {
      state = state.copyWith(age: state.age - 1, greaterThanFive: false);
    } else
      state = state.copyWith(age: state.age - 1);
  }

  incrementAge() {
    final currentAge = state.age;
    if (currentAge > 5) {
      state = state.copyWith(age: state.age + 1, greaterThanFive: true);
    } else
      state = state.copyWith(age: state.age + 1);
  }
}

final dataClassStateNotifierProvider =
    StateNotifierProvider<DataClassStateNotifier, DataClass>(
        (ref) => DataClassStateNotifier());
