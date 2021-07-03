import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterChangeNotifier extends ChangeNotifier {
  int counter = 0;

  int age = 0;

  int mcounter = 0;

  void multiplicationCounter(){
    if (counter >= 1)
      mcounter = counter * 2;
    notifyListeners();
  }

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
    mcounter= 0;
    notifyListeners();
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
