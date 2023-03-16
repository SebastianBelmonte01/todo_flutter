import 'package:bloc/bloc.dart';

import '../classes/Task.dart';

class TodoListCubit extends Cubit<List<Task>> {
  TodoListCubit() : super([]);

  void addTask(Task task) {
    emit([...state, task]);
  }
}