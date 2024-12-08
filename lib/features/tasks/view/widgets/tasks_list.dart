import 'package:flutter/material.dart';
import 'package:lessons_tasks_assignment/domain/task.dart';
import 'package:lessons_tasks_assignment/features/lessons/lessons_route.dart';
import 'package:lessons_tasks_assignment/features/tasks/view/widgets/task_card.dart';
import 'package:lessons_tasks_assignment/l10n/l10n.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    required this.tasks,
    super.key,
  });

  final List<Task> tasks;

  static const doneButtonKey = Key('doneButton');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          if (tasks.isEmpty)
            Center(child: Text(context.l10n.tasksEmpty))
          else
            ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: tasks.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                return TaskCard(task: tasks[index]);
              },
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FilledButton(
              key: doneButtonKey,
              onPressed: () => LessonsRoute().go(context),
              child: Text(context.l10n.tasksDoneButtonLabel),
            ),
          ),
        ],
      ),
    );
  }
}
