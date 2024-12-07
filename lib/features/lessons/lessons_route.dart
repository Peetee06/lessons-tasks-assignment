import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lessons_tasks_assignment/features/lessons/cubit/lessons_cubit.dart';
import 'package:lessons_tasks_assignment/features/lessons/view/lessons_page.dart';
import 'package:lessons_tasks_assignment/repositories/lessons/interceptors/json_interceptor.dart';
import 'package:lessons_tasks_assignment/repositories/lessons/lessons_repository.dart';
import 'package:lessons_tasks_assignment/repositories/lessons/rest_client.dart';

part 'lessons_route.g.dart';

@TypedGoRoute<LessonsRoute>(
  path: '/lessons',
)
@immutable
class LessonsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    final lessonsRepository = LessonsRepository(
      restClient: RestClient(Dio()..interceptors.add(JsonInterceptor())),
    );
    return BlocProvider(
      create: (context) => LessonsCubit(lessonsRepository)..fetchLessons(),
      child: const LessonsPage(),
    );
  }
}
