
import 'dart:async';

class Task {

  String title = "";
  String label = "";
  bool completed = false;
  DateTime initialDate = DateTime.now();
  DateTime dueDate = DateTime.now();

  Task(String title, String label, DateTime dueDate){
    this.title = title;
    this.label = label;
    this.completed = false;
    this.initialDate = DateTime.now();
    this.dueDate = dueDate;
  }
}