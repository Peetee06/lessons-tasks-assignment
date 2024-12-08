import 'package:lessons_tasks_assignment/data/services/rest_client.dart';
import 'package:lessons_tasks_assignment/domain/lesson.dart';

class LessonsRepository {
  LessonsRepository({
    required this.restClient,
  });

  final RestClient restClient;

  Future<List<Lesson>> getLessons() async {
    final lessons = await restClient.getLessons();
    final tasks = await restClient.getTasks();
    final tasksMap = {for (final task in tasks) task.id: task};

    return lessons
        .map(
          (lesson) => Lesson(
            id: lesson.id,
            title: lesson.title,
            pages: lesson.pages,
            tasks: lesson.taskIds.map((id) => tasksMap[id]!).toList(),
          ),
        )
        .toList();
  }
}
