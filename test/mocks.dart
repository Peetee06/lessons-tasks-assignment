import 'package:dio/dio.dart';
import 'package:lessons_tasks_assignment/features/lessons/cubit/lessons_cubit.dart';
import 'package:lessons_tasks_assignment/repositories/lessons/lessons_repository.dart';
import 'package:lessons_tasks_assignment/repositories/lessons/rest_client.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  Dio,
  RestClient,
  LessonsCubit,
  LessonsRepository,
])
class GeneratedMocks {}
