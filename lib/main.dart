import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  int _counter = 0;

  final StreamController _stremController = StreamController<int>();

  void _incrementCounter() {
    _stremController.sink.add(_counter++);
    // setState(() {
    //   _counter++;
    // });
  }

  Stream<int> incrementStream() async* {
    for (var i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  Future<int?> incrementFuture() async {
    for (var i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      return i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
              initialData: 0,
              stream: incrementStream(),
              builder: (context, snapShotlar) {
                return Text(
                  '${snapShotlar.data}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            FutureBuilder(
              initialData: 0,
              future: incrementFuture(),
              builder: (context, snapShotlar) {
                return Text(
                  '${snapShotlar.data}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
