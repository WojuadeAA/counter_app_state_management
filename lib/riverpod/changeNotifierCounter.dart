import 'package:counter_app/riverpod/changeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeNotiferExampleScreen extends ConsumerWidget {
  const ChangeNotiferExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final counterChangeNotiferValue = watch(counterChangeNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter change  Notifier"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "${counterChangeNotiferValue.counter}",
              style: TextStyle(color: Colors.red, fontSize: 40),
            ),
          ),
          Text(
            "${counterChangeNotiferValue.age}",
            style: TextStyle(color: Colors.blue, fontSize: 40),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context
                      .read(counterChangeNotifierProvider.notifier)
                      .decrementCounter();
                },
                tooltip: "Decrement",
                child: Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () {
                  context
                      .read(counterChangeNotifierProvider.notifier)
                      .incrementCounter();
                },
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                context
                    .read(counterChangeNotifierProvider.notifier)
                    .incrementAge();
              },
              child: Text("Increment Age"))
        ],
      ),
    );
  }
}
