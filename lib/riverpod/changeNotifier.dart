import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterChangeNotifier extends ChangeNotifier {
  int counter = 0;

  int age = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  void decrementCounter() {
    counter--;
    notifyListeners();
  }

  void refreshCounter() {
    counter = 0;
  }

  void incrementAge() {
    if (counter > 10) {
      age = 20;
      notifyListeners();
    } else {
      age++;
      notifyListeners();
    }
  }
}

final counterChangeNotifierProvider =
    ChangeNotifierProvider((ref) => CounterChangeNotifier());
