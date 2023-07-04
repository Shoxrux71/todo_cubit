import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../data/models/data.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit()
      : super(
          TodoInitial(
            [
              Todo(
                  id: UniqueKey().toString(),
                  user1: '1',
                  title: "明日は、のみかえに 行きます",
                  isDone: false),
              Todo(
                  id: UniqueKey().toString(),
                  user1: '1',
                  title: "Go to school",
                  isDone: false),
              Todo(
                  id: UniqueKey().toString(),
                  user1: '2',
                  title: "Home work ",
                  isDone: true),
              Todo(
                  id: UniqueKey().toString(),
                  user1: '2',
                  title: "Home clear ",
                  isDone: false),
            ],
          ),
        );

  void addTodo(String title) {
    try {
      final todo = Todo(id: UniqueKey().toString(), title: title, user1: '1');
      final todos = [...state.todos!, todo];
      // todos!.add(todo);
      emit(TodoState(todos: todos));
      emit(TodoAdded());
      print(todos);
    } catch (e) {
      emit(const TodoError(
        "Error,Try again please!",
      ));
    }
  }

  void editTodo(String id, String title) {
    try {
      final todos = state.todos!.map((t) {
        if (t.id == id) {
          return Todo(
            id: id,
            user1: t.user1,
            title: title,
            isDone: t.isDone,
          );
        }
        return t;
      }).toList();
      // final index = todos!.indexWhere((t) => t.id == todo.id);
      // todos[index] = todo;
      emit(TodoState(todos: todos));
      emit(TodoEdited());
      print(todos);
    } catch (e) {
      emit(const TodoError(
        "Error,Try again please!",
      ));
    }
  }

  void toggleTodo(String id) {
    // final todo = state.todos.firstWhere((idT) => idT.id == id);

    // todo.isDone = !todo.isDone;
    final todos = state.todos!.map((todo) {
      if (todo.id == id) {
        return Todo(
            user1: todo.user1, id: id, title: todo.title, isDone: !todo.isDone);
      }
      return todo;
    }).toList();
    // final index = todos!.indexWhere((t) => t.id == id);
    // todos[index].isDone = !todos[index].isDone;

    emit(todoToggle());
    emit(TodoState(todos: todos));
  }

  void deleteTodo(String id) {
    final todos = state.todos;
    todos!.removeWhere((todo) => todo.id == id);
    emit(todoDelete());
    emit(TodoState(todos: todos));
  }

  List<Todo> searchTodos(String title) {
    return state.todos!
        .where(
          (todo) => todo.title.toLowerCase().contains(
                title.toLowerCase(),
              ),
        )
        .toList();
  }
}
