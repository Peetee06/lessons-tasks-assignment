import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lessons_tasks_assignment/domain/lesson.dart';

part 'lesson_state.freezed.dart';

@freezed
class LessonState with _$LessonState {
  const factory LessonState.initial() = _Initial;
  const factory LessonState.loading() = _Loading;
  const factory LessonState.loaded(Lesson lesson) = _Loaded;
  const factory LessonState.error(String message) = _Error;
}
