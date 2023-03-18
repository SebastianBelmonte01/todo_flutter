import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/bloc/cubit/label/label_list_cubit.dart';
import 'package:todo_flutter/pages/login.dart';
import 'package:todo_flutter/pages/register-new-task.dart';
import 'package:todo_flutter/pages/todo.dart';
import 'package:todo_flutter/pages/register-new-label.dart';

import 'package:todo_flutter/classes/Task.dart';

import 'bloc/cubit/todo/todo_list_cubit.dart';



void main() {
  runApp(MyApp());
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
        BlocProvider<LabelListCubit>(
          create: (context) => LabelListCubit(),
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
  }
}
