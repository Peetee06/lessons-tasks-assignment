import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:lessons_tasks_assignment/data/repositories/challenges/challenges_repository.dart';
import 'package:lessons_tasks_assignment/data/repositories/concepts/concepts_repository.dart';
import 'package:lessons_tasks_assignment/data/services/rest_client.dart';
import 'package:lessons_tasks_assignment/features/challenges/cubit/challenges_cubit.dart';
import 'package:lessons_tasks_assignment/features/concept/cubit/concept_cubit.dart';
import 'package:lessons_tasks_assignment/features/concepts/cubit/concepts_cubit.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  CacheManager,
  Dio,
  GoRouter,
  HttpClientAdapter,
  ConceptCubit,
  ConceptsCubit,
  ConceptsRepository,
  RestClient,
  ChallengesCubit,
  ChallengesRepository,
])
class GeneratedMocks {}
