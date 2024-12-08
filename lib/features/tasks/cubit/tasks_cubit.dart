import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lessons_tasks_assignment/data/repositories/lessons/lessons_repository.dart';
import 'package:lessons_tasks_assignment/data/repositories/tasks/tasks_repository.dart';
import 'package:lessons_tasks_assignment/domain/task.dart';
import 'package:lessons_tasks_assignment/features/tasks/cubit/tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit({
    required this.tasksRepository,
    required this.lessonsRepository,
    required this.lessonId,
  }) : super(const TasksState.initial());

  final TasksRepository tasksRepository;
  final LessonsRepository lessonsRepository;
  final String lessonId;

  Future<void> fetchTasks() async {
    emit(const TasksState.loading());
    try {
      final taskIds = await _getLessonTaskIds();
      final tasks = await _getTasks(taskIds);
      emit(TasksState.loaded(tasks));
    } catch (e) {
      _handleError(e);
    }
  }

  /// Returns the task ids for the lesson with the given [lessonId].
  ///
  /// Throws [StateError] if the lesson with the given [lessonId] is not found.
  Future<List<String>> _getLessonTaskIds() async {
    final lessons = await lessonsRepository.getLessons();
    final lesson = lessons.firstWhere((lesson) => lesson.id == lessonId);

    return lesson.taskIds;
  }

  /// Returns the tasks with the given [taskIds].
  ///
  /// Throws [AssertionError] if any of the tasks with the given [taskIds]
  /// are not found.
  Future<List<Task>> _getTasks(List<String> taskIds) async {
    final allTasks = await tasksRepository.getTasks();
    final tasksMapped = {for (final task in allTasks) task.id: task};

    return taskIds.map((id) {
      final task = tasksMapped[id];
      assert(task != null, 'Task with id $id not found');
      return task!;
    }).toList();
  }

  void _handleError(Object e) {
    switch (e) {
      case AssertionError(:final message):
        emit(TasksState.error(message!.toString()));
        addError(Exception(message));
      case StateError():
        final message = 'Lesson with id $lessonId not found';
        emit(TasksState.error(message));
        addError(Exception(message));
      default:
        emit(const TasksState.error('Failed to fetch tasks'));
        addError(e);
    }
  }
}
