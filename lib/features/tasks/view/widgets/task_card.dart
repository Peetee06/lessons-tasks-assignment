import 'package:flutter/material.dart';
import 'package:lessons_tasks_assignment/common/extensions/localizations_extension.dart';
import 'package:lessons_tasks_assignment/domain/task.dart';

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({
    required this.challenge,
    super.key,
  });

  final Challenge challenge;

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
              challenge.question.localizedTo(Localizations.localeOf(context)),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ...challenge.options.map(
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
