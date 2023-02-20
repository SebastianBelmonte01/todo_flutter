import 'package:flutter/material.dart';
import 'package:todo_flutter/login.dart';
import 'package:todo_flutter/register-new-task.dart';
import 'package:todo_flutter/todo.dart';
import 'package:todo_flutter/register-new-label.dart';

import 'package:todo_flutter/classes/Task.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Task> tasksList = [];
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MyLogin(),
        '/todo':(context) =>  MyTodo(myTasks: tasksList,),
        '/register-new-tasks':(context) =>  const MyRegistrationTask(),
        '/register-new-labels':(context) => const MyNewLabel()
      },
    );
  }
}
