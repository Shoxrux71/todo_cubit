import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../data/models/tod.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit()
      : super(
          TodoInitial(
            [
              Todo(
                  id: UniqueKey().toString(), title: "McDonals", isDone: false),
              Todo(
                  id: UniqueKey().toString(),
                  title: "Go to school",
                  isDone: false),
              Todo(
                  id: UniqueKey().toString(),
                  title: "Homework doing",
                  isDone: true),
            ],
          ),
        );

  void addTodo(String title) {
    try {
      final todo = Todo(id: UniqueKey().toString(), title: title);
      final todos = state.todos;
      todos.add(todo);
      emit(TodoState(todos));
      emit(TodoAdded(todos));
      print(todos);
    } catch (e) {
      emit(TodoError("Error,Try again please!", state.todos));
    }
  }
}
