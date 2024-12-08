import 'package:flutter/material.dart';
import 'package:lessons_tasks_assignment/common/extensions/localizations_extension.dart';
import 'package:lessons_tasks_assignment/domain/task.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    required this.task,
    super.key,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.question.localizedTo(Localizations.localeOf(context)),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ...task.options.map(
              (option) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  option.text.localizedTo(Localizations.localeOf(context)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
