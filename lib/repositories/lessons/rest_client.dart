import 'package:dio/dio.dart';
import 'package:lessons_tasks_assignment/domain/task.dart';
import 'package:lessons_tasks_assignment/repositories/lessons/models/raw_lesson.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(
  baseUrl: RestClient.baseUrl,
)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  static const baseUrl =
      'https://raw.githubusercontent.com/Peetee06/lessons-tasks-assignment/refs/heads/main/';

  @GET('/mock_lessons.json')
  Future<List<RawLesson>> getLessons();

  @GET('/mock_tasks.json')
  Future<List<Task>> getTasks();
}
