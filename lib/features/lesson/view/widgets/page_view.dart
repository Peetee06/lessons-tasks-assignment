import 'package:flutter/material.dart' hide Page;
import 'package:lessons_tasks_assignment/common/extensions/localizations_extension.dart';
import 'package:lessons_tasks_assignment/domain/content_component.dart';
import 'package:lessons_tasks_assignment/domain/page.dart';

class LessonPageView extends StatelessWidget {
  const LessonPageView({
    required this.page,
    super.key,
  });

  final Page page;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: page.content.length,
      itemBuilder: (context, index) {
        final component = page.content[index];
        return switch (component) {
          TextComponent(:final text) => Text(
              text.localizedTo(Localizations.localeOf(context)),
            ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}
