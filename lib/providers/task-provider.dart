import 'package:flutter/material.dart';
import 'package:todo_flutter/classes/Task.dart';

class TodoList extends ChangeNotifier {
  List<Task> _todoList = [];

  int get size => _todoList.length;

  List<Task> get list => _todoList;

  void addTask(Task task) {
    _todoList.add(task);
    notifyListeners();
  }

}