
import 'dart:async';

class Task {

  String title = "";
  String label = "";
  bool completed = false;
  DateTime initialDate = DateTime.now();
  DateTime dueDate = DateTime.now();

  get getTitle => this.title;

 set setTitle( title) => this.title = title;

  get getLabel => this.label;

 set setLabel( label) => this.label = label;

  get getCompleted => this.completed;

 set setCompleted( completed) => this.completed = completed;

  get getInitialDate => this.initialDate;

 set setInitialDate( initialDate) => this.initialDate = initialDate;

  get getDueDate => this.dueDate;

 set setDueDate( dueDate) => this.dueDate = dueDate;

  Task(String title, String label, DateTime dueDate){
    this.title = title;
    this.label = label;
    this.completed = false;
    this.initialDate = DateTime.now();
    this.dueDate = dueDate;
  }
}