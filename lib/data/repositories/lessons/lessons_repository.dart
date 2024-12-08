import 'package:lessons_tasks_assignment/data/services/rest_client.dart';
import 'package:lessons_tasks_assignment/domain/lesson.dart';

class LessonsRepository {
  LessonsRepository({
    required this.restClient,
  });

  final RestClient restClient;

  Future<List<Lesson>> getLessons() async {
    return restClient.getLessons();
  }
}
