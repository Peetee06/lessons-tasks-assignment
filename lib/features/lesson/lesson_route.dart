import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:lessons_tasks_assignment/data/repositories/lessons/lessons_repository.dart';
import 'package:lessons_tasks_assignment/features/lesson/cubit/lesson_cubit.dart';
import 'package:lessons_tasks_assignment/features/lesson/view/lesson_view.dart';

@immutable
class ConceptRoute extends GoRouteData {
  const ConceptRoute({required this.id});

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => ConceptCubit(
        GetIt.I<ConceptsRepository>(),
      )..fetchConcept(id),
      child: const ConceptView(),
    );
  }
}
