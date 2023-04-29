
import 'dart:async';

class Task {
  int? id;
  String? title;
  String? label;
  bool? completed;
  DateTime? initialDate;
  DateTime? dueDate;

  Task(int id, String title, DateTime initialDate, String label, bool completed, DateTime dueDate){
    this.id = id;
    this.title = title;
    this.label = label;
    this.completed = completed;
    this.initialDate = initialDate;
    this.dueDate = dueDate;
  }



  factory Task.fromJson(Map<String, dynamic> json){
    print("Task.fromJson");
    return Task(
    json["id"],
    json['description'],
    DateTime.parse(json['date']),
    json['label'],
    json['completed'],
    DateTime.parse(json['completedDate'])
    ); 
  }
}