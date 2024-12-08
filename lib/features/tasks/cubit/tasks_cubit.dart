import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lessons_tasks_assignment/data/repositories/tasks/tasks_repository.dart';
import 'package:lessons_tasks_assignment/features/tasks/cubit/tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit(this.tasksRepository, {required this.taskIds})
      : super(const TasksState.initial());
  final TasksRepository tasksRepository;
  final List<String> taskIds;

  Future<void> fetchTasks() async {
    emit(const TasksState.loading());
    try {
      final allTasks = await tasksRepository.getTasks();
      final tasksMapped = {for (final task in allTasks) task.id: task};
      final tasks = taskIds.map((id) {
        final task = tasksMapped[id];
        assert(task != null, 'Task with id $id not found');
        return task!;
      }).toList();
      emit(TasksState.loaded(tasks));
    } catch (e) {
      switch (e) {
        case AssertionError(:final message):
          emit(TasksState.error(message!.toString()));
          addError(Exception(message));
        default:
          emit(const TasksState.error('Failed to fetch tasks'));
          addError(e);
      }
    }
  }
}
