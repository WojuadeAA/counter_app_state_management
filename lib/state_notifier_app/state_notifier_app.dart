import 'stateNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateNotifierApp extends StatelessWidget {
  const StateNotifierApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: StateNotifierHome(),
    );
  }
}

class StateNotifierHome extends StatelessWidget {
  const StateNotifierHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  final counter = watch(counterStateNotifierProvider);

                  return Text(
                    '$counter',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  );
                },
              ),
            ),

            ///Don't do this : its not safe
            // Padding(
            //   padding: const EdgeInsets.all(18.0),
            //   child: Text(
            //     '${context.read(counterStateNotifierProvider)}',
            //     style: TextStyle(color: Colors.white, fontSize: 30),
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: context
                      .read(counterStateNotifierProvider.notifier)
                      .decrementFunction,
                  tooltip: "Decrement",
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: context
                      .read(counterStateNotifierProvider.notifier)
                      .incrementFunction,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.yellow),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => StateNotifierNewScreen()));
              },
              child: Text(
                "New Screen",
                // style: TextStyle(fontSize: 50),
              ),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed:
            context.read(counterStateNotifierProvider.notifier).refreshFunction,
        tooltip: 'Refresh',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class StateNotifierNewScreen extends StatelessWidget {
  const StateNotifierNewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Screen"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //comment
            Center(
              child: Consumer(
                builder: (context, watch, _) {
                  final counter = watch(counterStateNotifierProvider);
                  return Row(
                    children: [
                      Text(
                        "$counter",
                        style: TextStyle(
                          fontSize: 50,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  tooltip: "Decrement",
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: context
                      .read(counterStateNotifierProvider.notifier)
                      .incrementFunction,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // widget.decreaseByValueFunction(secondSecondScreenVariable);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.remove),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
