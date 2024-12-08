import 'package:flutter/widgets.dart';
import 'package:lessons_tasks_assignment/domain/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    required this.tasks,
    super.key,
  });

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
