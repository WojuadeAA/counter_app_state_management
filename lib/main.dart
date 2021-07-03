import 'package:counter_app/state_notifier_app/state_notifier_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: StateNotifierApp()));
  // runApp(ProviderScope(child: RiverpodApp()));
  // runApp(MyApp());
}

typedef ValueChanged<T> = void Function(T value);
// typedef DecreaseByValueType<T> = void Function(T value);
// typedef DecreaseByValueMultiParameters<T> = void Function(
//     T value, T secondValue, T thirdValue);

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;

  void _multiplyByValue(int value) {
    setState(() {
      _counter = value * _counter;
    });
  }

  void _decreaseByValue(int value) {
    setState(() {
      _counter = _counter - value;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _refreshCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // _decreaseByValue();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        counter: _counter,
        decreaseFunction: _decrementCounter,
        incrementFunction: _incrementCounter,
        refreshFunction: _refreshCounter,
        decreaseByValueFunction: _decreaseByValue,
        increaseByValue: _multiplyByValue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
    required this.title,
    required this.counter,
    required this.incrementFunction,
    required this.decreaseFunction,
    required this.refreshFunction,
    required this.decreaseByValueFunction,
    required this.increaseByValue,
  }) : super(key: key);
  final int counter;
  final Function() incrementFunction;
  final Function() decreaseFunction;
  final Function(int value) decreaseByValueFunction;
  final Function() refreshFunction;
  final ValueChanged<int> increaseByValue;
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
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
              child: Text(
                '${widget.counter}',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: widget.decreaseFunction,
                  tooltip: "Decrement",
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: widget.incrementFunction,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.yellow),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NewScreen(widget.counter,
                      widget.incrementFunction, widget.decreaseByValueFunction),
                ));
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
        onPressed: widget.refreshFunction,
        tooltip: 'Refresh',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NewScreen extends StatefulWidget {
  final int counterFromHomePage;
  final dynamic incrementFunction;

  final Function(int value) decreaseByValueFunction;

  const NewScreen(this.counterFromHomePage, this.incrementFunction,
      this.decreaseByValueFunction);

  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  var secondSecondScreenVariable = 5;
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
              child: Text(
                "${widget.counterFromHomePage}",
                style: TextStyle(
                  fontSize: 50,
                ),
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
                  onPressed: widget.incrementFunction,
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
                    widget.decreaseByValueFunction(secondSecondScreenVariable);
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
