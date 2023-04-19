import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/classes/Task.dart';
import 'package:todo_flutter/pages/register_new_task.dart';

import 'package:intl/intl.dart';

import '../bloc/cubit/todo/todo_list_cubit.dart';
import 'package:shimmer/shimmer.dart';
class MyListView extends StatefulWidget {
  MyListView({super.key});
  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<TodoListCubit, TodoListState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.listOfTasks.length,
          itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  border: 
                    Border.all(
                      color: Colors.black45
                    ) 
                ),
                child: ListTile(  
                      title: Text(state.listOfTasks[index].title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          )),
                      subtitle: Text(state.listOfTasks[index].completed ? 'Tarea Completada el : ${DateFormat('dd-MM-yyyy').format(state.listOfTasks[index].initialDate)} \nEtiqueta: ${state.listOfTasks[index].label}' : 'Fecha Limite para Realizar Tarea : ${DateFormat('dd-MM-yyyy').format(state.listOfTasks[index].dueDate)} \nEtiqueta: ${state.listOfTasks[index].label}' ),
                      trailing : Icon(
                        state.listOfTasks[index].completed ? Icons.done : Icons.close,
                        color: state.listOfTasks[index].completed ? const Color.fromARGB(255, 22, 174, 14) : const Color.fromARGB(255, 193, 16, 16),
                      ), 
                      isThreeLine: true,
                      onLongPress: () {
                        context.read<TodoListCubit>().completedTask(state.listOfTasks[index]);
                      },
                ),
              );
          },
        );
      },
    );
  }
}

class LoadingMyListView extends StatelessWidget {
  const LoadingMyListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!, 
      highlightColor: Colors.grey[100]!, 
      child: ListView.builder(
        itemBuilder: (_, __){
          return Container(
                decoration: BoxDecoration(
                  border: 
                    Border.all(
                      color: Colors.white
                    ) 
                ),
                child: ListTile(  
                      title: Container(
                        width: 5,
                        height: 20,
                        color: Colors.white,
                      ),
                      subtitle: Container(
                        width: 10,
                        height: 10,
                        color: Colors.white,
                      ),
                      trailing : Container(
                        width: 20,
                        height: 20,
                        color: Colors.white,
                      ),
                      isThreeLine: true,
                ),
              );
        }, 
        itemCount: 10),
    );
  }
}