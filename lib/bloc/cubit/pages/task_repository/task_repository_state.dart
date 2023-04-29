part of 'task_repository_cubit.dart';

class TaskRepositoryState extends Equatable {
  final PageStatus status;
  final List<Task> tasks;
  
  

  const TaskRepositoryState({
    this.status = PageStatus.initial,
    this.tasks =  const [],
  });

  TaskRepositoryState copyWith({
    PageStatus? status,
    List<Task>? tasks,
  }) {
    return TaskRepositoryState(
      status: status ?? this.status,
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  List<Object> get props => [
    status,
    tasks
  ];
}

