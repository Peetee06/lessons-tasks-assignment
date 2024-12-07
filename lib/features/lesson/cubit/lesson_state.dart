import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lessons_tasks_assignment/domain/lesson.dart';

part 'lesson_state.freezed.dart';

@freezed
class LessonState with _$LessonState {
  const factory LessonState.initial() = LessonInitial;
  const factory LessonState.loading() = LessonLoading;
  const factory LessonState.loaded(Lesson lesson) = LessonLoaded;
  const factory LessonState.error(String message) = LessonError;
}
