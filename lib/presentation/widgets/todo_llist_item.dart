import 'package:flutter/material.dart';
import '../../data/models/tod.dart';
import 'manage_todo.dart';

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
      builder: (ctx) => ManageTodo(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(todo.isDone
          ? Icons.check_circle_outline_outlined
          : Icons.circle_outlined),
      title: Text(todo.title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () => openManageTodo(context),
            icon: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
