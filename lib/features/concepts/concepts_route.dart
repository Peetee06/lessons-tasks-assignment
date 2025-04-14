import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:lessons_tasks_assignment/data/repositories/concepts/concepts_repository.dart';
import 'package:lessons_tasks_assignment/features/challenges/challenges_route.dart';
import 'package:lessons_tasks_assignment/features/concept/concept_route.dart';
import 'package:lessons_tasks_assignment/features/concepts/cubit/concepts_cubit.dart';
import 'package:lessons_tasks_assignment/features/concepts/view/concepts_view.dart';

part 'concepts_route.g.dart';

@TypedGoRoute<ConceptsRoute>(
  path: '/concepts',
  name: 'concepts',
  routes: [
    TypedGoRoute<ConceptRoute>(
      path: ':id',
      name: 'concept',
      routes: [
        TypedGoRoute<ChallengesRoute>(
          path: 'challenges',
          name: 'challenges',
        ),
      ],
    ),
  ],
)
@immutable
class ConceptsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => ConceptsCubit(
        GetIt.I<ConceptsRepository>(),
      )..fetchConcepts(),
      child: const ConceptsView(),
    );
  }
}
