import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/logic/todo/todo_cubit.dart';
import 'package:todo_cubit/presentation/screens/todo_details.dart';
import 'package:todo_cubit/todo/cubit/todo_cubit.dart';
import './presentation/screens/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: MaterialApp(
        title: 'todo cubit',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const ToDoScreen(),
        initialRoute: '/',
        routes: {
          '/': (context) => const ToDoScreen(),
          '/todo-details': (context) => const TodoDetailsScreen(),
        },
      ),
    );
  }
}
