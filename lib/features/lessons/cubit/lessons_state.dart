import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lessons_tasks_assignment/domain/lesson.dart';

part 'lessons_state.freezed.dart';

@freezed
sealed class LessonsState with _$LessonsState {
  const factory LessonsState.initial() = LessonsInitial;
  const factory LessonsState.loading() = LessonsLoading;
  const factory LessonsState.loaded(List<Lesson> lessons) = LessonsLoaded;
  const factory LessonsState.error(String message) = LessonsError;
}
