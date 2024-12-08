import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lessons_tasks_assignment/data/repositories/lessons/lessons_repository.dart';
import 'package:lessons_tasks_assignment/data/services/interceptors/json_interceptor.dart';
import 'package:lessons_tasks_assignment/data/services/rest_client.dart';
import 'package:lessons_tasks_assignment/features/lesson/cubit/lesson_cubit.dart';
import 'package:lessons_tasks_assignment/features/lesson/view/lesson_view.dart';

@immutable
class LessonRoute extends GoRouteData {
  const LessonRoute({required this.id});

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final lessonsRepository = LessonsRepository(
      restClient: RestClient(Dio()..interceptors.add(JsonInterceptor())),
    );
    return BlocProvider(
      create: (context) => LessonCubit(lessonsRepository)..fetchLesson(id),
      child: const LessonView(),
    );
  }
}
