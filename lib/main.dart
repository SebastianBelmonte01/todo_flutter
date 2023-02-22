import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/login.dart';
import 'package:todo_flutter/providers/task-provider.dart';
import 'package:todo_flutter/register-new-task.dart';
import 'package:todo_flutter/todo.dart';
import 'package:todo_flutter/register-new-label.dart';

import 'package:todo_flutter/classes/Task.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TodoList())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MyLogin(),
        '/todo':(context) =>  MyTodo(),
        '/register-new-tasks':(context) =>  const MyRegistrationTask(),
        '/register-new-labels':(context) => const MyNewLabel()
      },
    );
  }
}
