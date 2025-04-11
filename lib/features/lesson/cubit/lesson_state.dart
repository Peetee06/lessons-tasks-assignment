import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lessons_tasks_assignment/domain/lesson.dart';

part 'lesson_state.freezed.dart';

@freezed
sealed class ConceptState with _$ConceptState {
  const factory ConceptState.initial() = ConceptInitial;
  const factory ConceptState.loading() = ConceptLoading;
  const factory ConceptState.loaded(Concept concept) = ConceptLoaded;
  const factory ConceptState.error(String message) = ConceptError;
}
