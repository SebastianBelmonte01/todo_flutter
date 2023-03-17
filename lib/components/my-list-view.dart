import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/classes/Task.dart';
import 'package:todo_flutter/register-new-task.dart';

import 'package:intl/intl.dart';

import '../bloc/cubit/todo/todo_list_cubit.dart';
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
                      border: Border.all(
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
                        color: state.listOfTasks[index].completed ? Color.fromARGB(255, 22, 174, 14) : Color.fromARGB(255, 193, 16, 16),
                      ), 
                      isThreeLine: true,
                      onLongPress: () {
                        //FIX ME - In this case My State completed should be updated, however this widget is a cosummer but also a builder, so it is not possible to update the state of the cubit
                        TodoListCubit todoListCubit = BlocProvider.of<TodoListCubit>(context);
                        todoListCubit.completedTask(state.listOfTasks[index]);
                      },
                    ),
                  );
                    },
                  );
      },
    );
    

  }

}