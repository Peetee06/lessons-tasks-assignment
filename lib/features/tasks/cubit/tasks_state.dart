import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lessons_tasks_assignment/domain/task.dart';

part 'tasks_state.freezed.dart';

@freezed
sealed class ChallengesState with _$ChallengesState {
  const factory ChallengesState.initial() = ChallengesInitial;
  const factory ChallengesState.loading() = ChallengesLoading;
  const factory ChallengesState.loaded(List<Challenge> challenges) =
      ChallengesLoaded;
  const factory ChallengesState.error(String message) = ChallengesError;
}
