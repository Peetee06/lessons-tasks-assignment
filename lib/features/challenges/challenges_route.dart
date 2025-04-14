import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:lessons_tasks_assignment/data/repositories/challenges/challenges_repository.dart';
import 'package:lessons_tasks_assignment/data/repositories/concepts/concepts_repository.dart';
import 'package:lessons_tasks_assignment/features/challenges/cubit/challenges_cubit.dart';
import 'package:lessons_tasks_assignment/features/challenges/view/challenges_view.dart';

@immutable
class ChallengesRoute extends GoRouteData {
  const ChallengesRoute({required this.id});

  /// The id of the concept to fetch the challenges for.
  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => ChallengesCubit(
        challengesRepository: GetIt.I<ChallengesRepository>(),
        conceptsRepository: GetIt.I<ConceptsRepository>(),
        conceptId: id,
      )..fetchChallenges(),
      child: const ChallengesView(),
    );
  }
}
