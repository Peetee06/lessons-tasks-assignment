import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:lessons_tasks_assignment/data/repositories/lessons/lessons_repository.dart';
import 'package:lessons_tasks_assignment/features/lesson/lesson_route.dart';
import 'package:lessons_tasks_assignment/features/lessons/cubit/lessons_cubit.dart';
import 'package:lessons_tasks_assignment/features/lessons/view/lessons_view.dart';
import 'package:lessons_tasks_assignment/features/tasks/tasks_route.dart';

part 'lessons_route.g.dart';

@TypedGoRoute<LessonsRoute>(
  path: '/lessons',
  name: 'lessons',
  routes: [
    TypedGoRoute<LessonRoute>(
      path: ':id',
      name: 'lesson',
      routes: [
        TypedGoRoute<TasksRoute>(
          path: 'tasks',
          name: 'tasks',
        ),
      ],
    ),
  ],
)
@immutable
class LessonsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => LessonsCubit(
        GetIt.I<LessonsRepository>(),
      )..fetchLessons(),
      child: const LessonsView(),
    );
  }
}
