import 'package:counter_app/riverpod/changeNotifierCounter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firstProvider = Provider((ref) => "Mide");

final counterProvider = StateProvider((ref) => 0);

final multiProvider = StateProvider((ref) => 0);


// stateNotifierProvider;

class RiverpodApp extends StatelessWidget {
  const RiverpodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: RiverpodHomePage());
  }
}

class RiverpodHomePage extends StatelessWidget {
  const RiverpodHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, watch, _) {
            final value = watch(firstProvider);
            return Text("$value");
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(
            builder: (context, watch, child) {
              final counterValue = watch(counterProvider);
              return Text(
                "${counterValue.state}",
                style: TextStyle(
                  fontSize: 30,
                ),
              );
            },
          ),
          Consumer(
            builder: (context, watch, child) {
              final multiValue = watch(multiProvider);
              return Text(
                "${multiValue.state}",
                style: TextStyle(
                  fontSize: 30,
                ),
              );
            },
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    context.read(counterProvider).state++;
                  },
                  child: Icon(Icons.add),
                ),
              ),
              // Center(
              //   child: ElevatedButton(
              //     onPressed: () {
              //       context.read(multiProvider).state;
              //     },
              //     child: Icon(Icons.dangerous),
              //   ),
              // ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    context.read(counterProvider).state--;
                  },
                  child: Icon(Icons.remove),
                ),
              ),
            ],
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RiverpodNewScreen(),
                    ));
              },
              child: Text("New Screen"),
            ),
          ),
        ],
      ),
    );
  }
}

class RiverpodNewScreen extends StatelessWidget {
  const RiverpodNewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("rebuilding newscreen builder");
    final value = context.read(firstProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("New screen $value"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(
            builder: (context, watch, child) {
              print("rebuilding newscreen consumer builder");
              final counterValue = watch(counterProvider);
              return Text(
                "${counterValue.state}",
                style: TextStyle(
                  fontSize: 30,
                ),
              );
            },
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    context.read(counterProvider).state++;
                  },
                  child: Icon(Icons.add),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    context.read(counterProvider).state--;
                  },
                  child: Icon(Icons.remove),
                ),
              ),
            ],
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RiverpodNewScreen(),
                    ));
              },
              child: Text("New Screen"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotiferExampleScreen(),
                    ));
              },
              child: Text("ChangeNotifier Screen"),
            ),
          ),
        ],
      ),
    );
  }
}
