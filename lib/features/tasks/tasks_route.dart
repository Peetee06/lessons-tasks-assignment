import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:lessons_tasks_assignment/data/repositories/lessons/lessons_repository.dart';
import 'package:lessons_tasks_assignment/data/repositories/tasks/tasks_repository.dart';
import 'package:lessons_tasks_assignment/features/tasks/cubit/tasks_cubit.dart';
import 'package:lessons_tasks_assignment/features/tasks/view/tasks_view.dart';

@immutable
class TasksRoute extends GoRouteData {
  const TasksRoute({required this.id});

  /// The id of the lesson to fetch the tasks for.
  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => TasksCubit(
        tasksRepository: GetIt.I<TasksRepository>(),
        lessonsRepository: GetIt.I<LessonsRepository>(),
        lessonId: id,
      )..fetchTasks(),
      child: const TasksView(),
    );
  }
}
