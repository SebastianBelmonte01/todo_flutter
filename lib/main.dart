import 'package:flutter/material.dart';
import 'package:todo_flutter/login.dart';
import 'package:todo_flutter/todo.dart';


void main() {
  runApp(const MaterialApp(
    home: MyApp(),
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
        '/todo':(context) => const MyTodo(),
      },
    );
  }
}
