import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:lessons_tasks_assignment/data/repositories/lessons/lessons_repository.dart';
import 'package:lessons_tasks_assignment/data/repositories/tasks/tasks_repository.dart';
import 'package:lessons_tasks_assignment/data/services/rest_client.dart';
import 'package:lessons_tasks_assignment/features/lesson/cubit/lesson_cubit.dart';
import 'package:lessons_tasks_assignment/features/lessons/cubit/lessons_cubit.dart';
import 'package:lessons_tasks_assignment/features/tasks/cubit/tasks_cubit.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  CacheManager,
  Dio,
  GoRouter,
  HttpClientAdapter,
  LessonCubit,
  LessonsCubit,
  LessonsRepository,
  RestClient,
  TasksCubit,
  TasksRepository,
])
class GeneratedMocks {}
