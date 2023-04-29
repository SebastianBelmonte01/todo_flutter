import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/bloc/cubit/pages/page_status.dart';
import 'package:todo_flutter/bloc/cubit/pages/task_repository/task_repository_cubit.dart';
import 'package:todo_flutter/pages/error.dart';
import 'package:todo_flutter/pages/register_new_task.dart';
import 'package:todo_flutter/classes/Task.dart';

import '../components/my_button.dart';
import '../components/my_list_view.dart';


class MyTodo extends StatelessWidget {
  const MyTodo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ToDo List", style: TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w900, fontSize: 30)), backgroundColor: Color(0xFF0D47A1),),
      body: MyListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyRegistrationTask()
            )
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
        if(state.status == PageStatus.loading) {
          return const LoadingMyToDo();
        } else if (state.status == PageStatus.success) {
          return const MyTodo();
        } else {
          return const MyError();
        }
      },
    );
  }
}

