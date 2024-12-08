import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lessons_tasks_assignment/domain/task.dart';

part 'tasks_state.freezed.dart';

@freezed
sealed class TasksState with _$TasksState {
  const factory TasksState.initial() = TasksInitial;
  const factory TasksState.loading() = TasksLoading;
  const factory TasksState.loaded(List<Task> tasks) = TasksLoaded;
  const factory TasksState.error(String message) = TasksError;
}
