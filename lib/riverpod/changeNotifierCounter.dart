import 'changeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeNotiferExampleScreen extends ConsumerWidget {
  const ChangeNotiferExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final counterChangeNotifierValue = watch(counterChangeNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter change  Notifier"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "${counterChangeNotifierValue.counter}",
              style: TextStyle(color: Colors.red, fontSize: 40),
            ),
          ),
          Text(
            "${counterChangeNotifierValue.age}",
            style: TextStyle(color: Colors.blue, fontSize: 40),
          ),
          Text(
            '${counterChangeNotifierValue.mcounter}',
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
          FloatingActionButton(
            onPressed: () {
              context
                  .read(counterChangeNotifierProvider.notifier)
                  .multiplicationCounter();
            },
            tooltip: 'Multiply',
            child: Icon(Icons.dangerous),
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
