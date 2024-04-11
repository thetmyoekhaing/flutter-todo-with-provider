import 'package:flutter/material.dart';
import 'package:todo/model/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  final dummyList = List.generate(
      5,
      (index) =>
          TodoModel(title: "Test $index", description: "Test $index desc"));

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  void addTodo() {
    final todoToAdd = TodoModel(
        title: titleController.text, description: descriptionController.text);
    dummyList.add(todoToAdd);
    notifyListeners();
  }

  void removeTodo(TodoModel todo) {
    dummyList.remove(todo);
    notifyListeners();
  }

  void todoToggler(TodoModel todo, {required bool boolean}) {
    for (var element in dummyList) {
      if (element == todo) {
        element.isDone = boolean;
      }
    }
    notifyListeners();
  }
}
