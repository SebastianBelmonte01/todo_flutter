import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../classes/Task.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState(listOfTasks: []));
}
