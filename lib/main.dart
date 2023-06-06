import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './logic/counter/counter_cubit.dart';
import './logic/counter/counter_state.dart';
// import 'package:todo_cubit/presentation/screens/other_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Stream<int> incrementStream() async* {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocListener<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state is CounterError) {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text(state.message),
                      ),
                    );
                  }
                },
                child: BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    if (state is CunterLoading) {
                      return const CircularProgressIndicator();
                    }
                    return Text(
                      '${state.number}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: context.read<CounterCubit>().increment,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: context.read<CounterCubit>().decrement,
              tooltip: 'decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
