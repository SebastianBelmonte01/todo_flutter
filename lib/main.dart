import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/bloc/cubit/label/label_list_cubit.dart';
import 'package:todo_flutter/bloc/cubit/pages/label_repository/label_repository_cubit.dart';
import 'package:todo_flutter/bloc/cubit/pages/login_page/login_cubit.dart';
import 'package:todo_flutter/bloc/cubit/pages/task_repository/task_repository_cubit.dart';
import 'package:todo_flutter/pages/login.dart';
import 'package:todo_flutter/pages/register_new_task.dart';
import 'package:todo_flutter/pages/splash.dart';
import 'package:todo_flutter/pages/todo.dart';
import 'package:todo_flutter/pages/register_new_label.dart';

import 'package:todo_flutter/classes/Task.dart';

import 'bloc/cubit/todo/todo_list_cubit.dart';
import 'package:page_transition/page_transition.dart';



void main() {
  runApp(const MyApp());
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
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<TaskRepository>(
          create: (context) => TaskRepository()..todoPage(),
        ),
        BlocProvider<LabelRepositoryCubit>(
          create: (context) => LabelRepositoryCubit(),
        )
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => AnimatedSplashScreen(splash: 'assets/checklist.png', nextScreen: const MyLogin(), backgroundColor: Color.fromARGB(255, 34, 90, 154),),
          '/login': (context) => const MyLogin(),
          '/todo':(context) =>  const MyTodo(),
          '/register-new-tasks':(context) =>  const MyRegistrationTask(),
          '/register-new-labels':(context) => const MyNewLabel()
        },
      ),
    );
  }
}


/**
 * Aquí te presento algunas opciones de colores en formato hexadecimal que podrían combinar bien con el tono 0xFF0D47A1:

#FFFFFF (blanco): El blanco es un color neutral que siempre combina bien con otros colores. En combinación con el azul oscuro, puede crear un efecto elegante y sofisticado.

#C9C9C9 (gris claro): El gris claro es otro color neutral que se puede combinar con el azul oscuro para crear una paleta elegante y sobria.

#FDB813 (amarillo brillante): El amarillo brillante es un color complementario al azul, por lo que puede crear una combinación vibrante y atractiva.

#2ECC71 (verde brillante): El verde brillante es un color que combina bien con el azul oscuro, especialmente en combinación con tonos más claros de verde.

#FFB6C1 (rosa claro): El rosa claro es un color que contrasta bien con el azul oscuro, creando una combinación delicada y femenina.

Estas son solo algunas opciones, pero hay muchos otros colores que podrían combinar bien con el tono 0xFF0D47A1, dependiendo del efecto que se quiera lograr.
 */