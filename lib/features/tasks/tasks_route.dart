import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lessons_tasks_assignment/data/repositories/lessons/lessons_repository.dart';
import 'package:lessons_tasks_assignment/data/repositories/tasks/tasks_repository.dart';
import 'package:lessons_tasks_assignment/data/services/interceptors/json_interceptor.dart';
import 'package:lessons_tasks_assignment/data/services/rest_client.dart';
import 'package:lessons_tasks_assignment/features/tasks/cubit/tasks_cubit.dart';
import 'package:lessons_tasks_assignment/features/tasks/view/tasks_view.dart';

@immutable
class TasksRoute extends GoRouteData {
  const TasksRoute({required this.id});

  /// The id of the lesson to fetch the tasks for.
  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final tasksRepository = TasksRepository(
      restClient: RestClient(Dio()..interceptors.add(JsonInterceptor())),
    );
    final lessonsRepository = LessonsRepository(
      restClient: RestClient(Dio()..interceptors.add(JsonInterceptor())),
    );
    return BlocProvider(
      create: (context) => TasksCubit(
        tasksRepository: tasksRepository,
        lessonsRepository: lessonsRepository,
        lessonId: id,
      )..fetchTasks(),
      child: const TasksView(),
    );
  }
}
