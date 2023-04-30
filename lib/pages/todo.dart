import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/bloc/cubit/pages/page_status.dart';
import 'package:todo_flutter/bloc/cubit/pages/task_repository/task_repository_cubit.dart';
import 'package:todo_flutter/pages/error.dart';
import 'package:todo_flutter/pages/register_new_label.dart';
import 'package:todo_flutter/pages/register_new_task.dart';
import 'package:todo_flutter/classes/Task.dart';

import '../bloc/cubit/pages/label_repository/label_repository_cubit.dart';
import '../components/my_button.dart';
import '../components/my_list_view.dart';
import 'login.dart';


class MyTodo extends StatelessWidget {
  const MyTodo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ToDo List", style: TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w900, fontSize: 30)), backgroundColor: Color(0xFF0D47A1),),
      body: MyListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
        BlocProvider.of<LabelRepositoryCubit>(context).getLabels(),
        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(builder: (BuildContext context) => const MyTaskScreen()),
          )
        },
        backgroundColor: const Color(0xFF0D47A1) ,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class LoadingMyToDo extends StatelessWidget {
  const LoadingMyToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ToDo List", style: TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w900, fontSize: 30)), backgroundColor: Color(0xFF0D47A1),),
      body: const LoadingMyListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
        
        },
        backgroundColor: const Color(0xFF0D47A1) ,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyTodoScreen extends StatelessWidget {
  const MyTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskRepository, TaskRepositoryState>(
      builder: (context, state) {
        if (state.status == PageStatus.initial) {
          print("Initial en todo");
          return const LoadingMyToDo();
        } else if (state.status == PageStatus.loading) {
          print("Loading en todo");
          return const LoadingMyToDo();
        } else if (state.status == PageStatus.success) {
          print("Success en todo");
          return const MyTodo();
        } else {
          return const MyError();
        }
      },
    );
  }
}

