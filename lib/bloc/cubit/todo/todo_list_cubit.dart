import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../classes/Task.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState(listOfTasks: [Task("title", "label", DateTime.now())]));
  //Add an element to the list
  void addTask(Task task) {
    List<Task> newList = state.listOfTasks;
    newList.add(task);
    emit(TodoListState(listOfTasks: newList));
  }

  void completedTask(Task task) {
    task.completed ? task.completed = false : task.completed = true;
    emit(TodoListState(listOfTasks: state.listOfTasks));
  }

}

