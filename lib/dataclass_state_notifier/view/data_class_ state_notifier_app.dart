import 'package:counter_app/dataclass_state_notifier/logic/data_class.dart';
import 'package:counter_app/dataclass_state_notifier/logic/data_class_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataClassStateNotifierApp extends StatelessWidget {
  const DataClassStateNotifierApp({Key? key}) : super(key: key);

  int walk() {
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    var variable = walk;
    variable();
    var variable1 = walk();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: DataClassStateNotifierHome(),
    );
  }
}

class DataClassStateNotifierHome extends StatelessWidget {
  const DataClassStateNotifierHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //used to listen and react to changes in your provider state/
    // commonly used for show dialogs, navigating etc (any action that does not require a widget rebuild)
    return ProviderListener<DataClass>(
      onChange: (context, dataClassState) {
        //  dataClassState.when())

        if (dataClassState.ageGreaterThanFive == true) {
          //showDialog , showmodal sheet or run a method or navigate to to another screen?

          showDialog(
              builder: (context) => AlertDialog(
                    title: Text("Age is greaterThanFive"),
                  ),
              context: context);
        }
      },
      provider: dataClassStateNotifierProvider,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("StateNotifer Home"),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Consumer(
                  builder: (context, watch, child) {
                    final dataclass = watch(dataClassStateNotifierProvider);

                    return Column(
                      children: [
                        Text("Counter Property",
                            style:
                                TextStyle(color: Colors.white, fontSize: 30)),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          '${dataclass.counter}',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ],
                    );
                  },
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    onPressed: context
                        .read(dataClassStateNotifierProvider.notifier)
                        .decrementCounter,
                    tooltip: "Decrement",
                    child: Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: context
                        .read(dataClassStateNotifierProvider.notifier)
                        .incrementCounter,
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Consumer(
                  builder: (context, watch, child) {
                    final dataclass = watch(dataClassStateNotifierProvider);

                    return Column(
                      children: [
                        Text("Age Property",
                            style:
                                TextStyle(color: Colors.white, fontSize: 30)),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          '${dataclass.age}',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    onPressed: context
                        .read(dataClassStateNotifierProvider.notifier)
                        .decerementAge,
                    tooltip: "Decrement",
                    child: Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: context
                        .read(dataClassStateNotifierProvider.notifier)
                        .incrementAge,
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                ],
              ),

              ///Don't do this : its not safe
              // Padding(
              //   padding: const EdgeInsets.all(18.0),
              //   child: Text(
              //     '${context.read(counterStateNotifierProvider)}',
              //     style: TextStyle(color: Colors.white, fontSize: 30),
              //   ),
              // ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.yellow),
                onPressed: () {},
                child: Text(
                  "New Screen",
                  // style: TextStyle(fontSize: 50),
                ),
              )
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Refresh',
          child: Icon(Icons.refresh),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
