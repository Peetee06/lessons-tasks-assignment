import 'package:lessons_tasks_assignment/data/services/rest_client.dart';
import 'package:lessons_tasks_assignment/domain/task.dart';

class TasksRepository {
  TasksRepository({
    required this.restClient,
  });

  final RestClient restClient;

  Future<List<Task>> getTasks() async {
    return restClient.getTasks();
  }
}
