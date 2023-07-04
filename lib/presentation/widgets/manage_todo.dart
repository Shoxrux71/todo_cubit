import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/data/models/data.dart';
import 'package:todo_cubit/logic/todo/todo_cubit.dart';
import 'package:todo_cubit/todo/cubit/todo_cubit.dart';

class ManageTodo extends StatelessWidget {
  final Todo? todo;
  ManageTodo({
    Key? key,
    this.todo,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  String _title = '';

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (todo == null) {
        // BlocProvider.of<TodoCubit>(context).addTodo(_title);
        context.read<TodoCubit>().addTodo(_title);
      } else {
        // BlocProvider.of<TodoCubit>(context).editTodo(
        //   Todo(id: todo!.id, title: _title, isDone: todo!.isDone),
        // );
        context.read<TodoCubit>().editTodo(
              todo!.id,
              _title,
              // Todo(id: todo!.id, title: _title, isDone: todo!.isDone),
            );
      }
      print(_title);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(todo);
    return BlocListener<TodoCubit, TodoState>(
      listener: (context, state) {
        if (state is TodoAdded || state is TodoEdited) {
          Navigator.of(context).pop();
        } else if (state is TodoError) {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Error'),
              content: Text(state.message),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                ),
                initialValue: todo == null ? '' : todo!.title,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please,enter title!';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () => _submit(context),
                    child: Text(todo == null ? 'Add' : 'Edit'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
