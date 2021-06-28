import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title!),
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
                '$_counter',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: _decrementCounter,
                  tooltip: "Decrement",
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.yellow),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NewScreen(_counter, _incrementCounter),
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
        onPressed: _refreshCounter,
        tooltip: 'Refresh',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NewScreen extends StatelessWidget {
  final int counterFromHomePage;
  final dynamic incrementFunction;
  const NewScreen(this.counterFromHomePage, this.incrementFunction);

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
            Center(
              child: Text(
                "$counterFromHomePage",
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
                  onPressed: incrementFunction,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
