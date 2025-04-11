import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lessons_tasks_assignment/domain/lesson.dart';

part 'lessons_state.freezed.dart';

@freezed
sealed class ConceptsState with _$ConceptsState {
  const factory ConceptsState.initial() = ConceptsInitial;
  const factory ConceptsState.loading() = ConceptsLoading;
  const factory ConceptsState.loaded(List<Concept> concepts) = ConceptsLoaded;
  const factory ConceptsState.error(String message) = ConceptsError;
}
