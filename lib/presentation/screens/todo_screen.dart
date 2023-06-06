import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/todo/cubit/todo_cubit.dart';
import '../widgets/todo_llist_item.dart';
import '../widgets/manage_todo.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  void openManageTodo(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (ctx) => ManageTodo(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO CUBIT'),
        actions: [
          IconButton(
            onPressed: () => openManageTodo(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          print(state.todos);
          return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (contex, index) =>
                todoList_Item(todo: state.todos[index]),
          );
        },
      ),
    );
  }
}
