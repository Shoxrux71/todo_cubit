import 'package:flutter/material.dart';
import 'package:todo_cubit/logic/todo/todo_cubit.dart';
import '../../data/models/data.dart';
import 'manage_todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class todoList_Item extends StatelessWidget {
  final Todo todo;

  const todoList_Item({
    super.key,
    required this.todo,
  });

  void openManageTodo(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (ctx) => ManageTodo(
        todo: todo,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () => context.read<TodoCubit>().toggleTodo(todo.id),
        icon: Icon(todo.isDone
            ? Icons.check_circle_outline_outlined
            : Icons.circle_outlined),
      ),
      title: Text(
        todo.title,
        style: TextStyle(
          decorationColor: Colors.green,
          decoration:
              todo.isDone ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => context.read<TodoCubit>().deleteTodo(todo.id),
            icon: const Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () => openManageTodo(context),
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
