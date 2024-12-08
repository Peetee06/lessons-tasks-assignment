import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:lessons_tasks_assignment/data/repositories/lessons/lessons_repository.dart';
import 'package:lessons_tasks_assignment/data/services/rest_client.dart';
import 'package:lessons_tasks_assignment/features/lesson/cubit/lesson_cubit.dart';
import 'package:lessons_tasks_assignment/features/lessons/cubit/lessons_cubit.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  CacheManager,
  Dio,
  HttpClientAdapter,
  LessonCubit,
  LessonsCubit,
  LessonsRepository,
  RestClient,
])
class GeneratedMocks {}
