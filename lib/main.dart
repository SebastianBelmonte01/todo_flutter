import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/login.dart';
import 'package:todo_flutter/providers/label-provider.dart';
import 'package:todo_flutter/providers/task-provider.dart';
import 'package:todo_flutter/register-new-task.dart';
import 'package:todo_flutter/todo.dart';
import 'package:todo_flutter/register-new-label.dart';

import 'package:todo_flutter/classes/Task.dart';

import 'bloc/cubit/todo_list_cubit.dart';


void main() {
  runApp(MyApp());
    /*
      MultiProvider is a widget that combines multiple ChangeNotifierProviders into one widget.
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TodoList()),
      ChangeNotifierProvider(create: (_) => LabelList())
    ],
    child: MyApp(),
  )
  */
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Adding the providers from Cubit, TodoList is a list of Task


    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoListCubit>(
          create: (context) => TodoListCubit(),
        ),
        // ChangeNotifierProvider(create: (_) => TodoList()),
        // ChangeNotifierProvider(create: (_) => LabelList())
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const MyLogin(),
          '/todo':(context) =>  MyTodo(),
          '/register-new-tasks':(context) =>  const MyRegistrationTask(),
          '/register-new-labels':(context) => const MyNewLabel()
        },
      ),
    );

    // return MaterialApp(
    //   initialRoute: '/',
    //   routes: {
    //     '/': (context) => const MyLogin(),
    //     '/todo':(context) =>  MyTodo(),
    //     '/register-new-tasks':(context) =>  const MyRegistrationTask(),
    //     '/register-new-labels':(context) => const MyNewLabel()
    //   },
    // );
  }
}
