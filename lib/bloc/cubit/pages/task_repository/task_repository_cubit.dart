import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../classes/Task.dart';
import '../../../../services/todo_service.dart';
import '../page_status.dart';

part 'task_repository_state.dart';

class TaskRepository extends Cubit<TaskRepositoryState> {
  TaskRepository() : super(const TaskRepositoryState());
  
  Future<void> todoPage() async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      print("TaskRepository: todoPage");
      List<Task> tasks = await TodoService.getTasks();
      emit(state.copyWith(status: PageStatus.success, tasks: tasks));
    } catch (e) {
      emit(state.copyWith(status: PageStatus.failure));
    }
  }

  Future<void> chageTaskStatus(List<Task> tasks, int index) async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      print("TaskRepository: updateTask");
      await TodoService.updateTask(tasks[index]);
      List<Task> tasksUpdate = await TodoService.getTasks();
      emit(state.copyWith(status: PageStatus.success, tasks: tasksUpdate));
    } catch (e) {
      emit(state.copyWith(status: PageStatus.failure));
    }
  }
}