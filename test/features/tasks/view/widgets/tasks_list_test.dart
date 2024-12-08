import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lessons_tasks_assignment/domain/answer.dart';
import 'package:lessons_tasks_assignment/domain/task.dart';
import 'package:lessons_tasks_assignment/features/tasks/view/widgets/task_card.dart';
import 'package:lessons_tasks_assignment/features/tasks/view/widgets/tasks_list.dart';
import 'package:lessons_tasks_assignment/l10n/l10n.dart';

import '../../../../helpers/helpers.dart';

void main() {
  final tasks = [
    const Task(
      id: '1',
      question: {
        'en': 'What is Flutter?',
        'de': 'Was ist Flutter?',
      },
      options: [
        Answer(id: 'a1', text: {'en': 'A framework', 'de': 'Ein Framework'}),
      ],
      correctAnswerIds: ['a1'],
    ),
    const Task(
      id: '2',
      question: {
        'en': 'What is Dart?',
        'de': 'Was ist Dart?',
      },
      options: [
        Answer(id: 'a1', text: {'en': 'A language', 'de': 'Eine Sprache'}),
        Answer(id: 'a2', text: {'en': 'A tool', 'de': 'Ein Werkzeug'}),
      ],
      correctAnswerIds: ['a1', 'a2'],
    ),
  ];

  Future<void> pumpAppWithTasksList(
    WidgetTester tester, {
    required List<Task> tasks,
  }) async {
    await tester.pumpApp(
      locale: const Locale('de'),
      widget: Material(
        child: TasksList(tasks: tasks),
      ),
    );
  }

  group('TasksList', () {
    testWidgets('renders empty state when no tasks', (tester) async {
      await pumpAppWithTasksList(tester, tasks: []);

      expect(find.text('Keine Aufgaben verfügbar'), findsOneWidget);
    });

    testWidgets('shows correct number of items', (tester) async {
      await pumpAppWithTasksList(tester, tasks: tasks);

      expect(find.byType(TaskCard), findsNWidgets(2));
    });

    testWidgets('shows back button', (tester) async {
      await pumpAppWithTasksList(tester, tasks: tasks);

      expect(find.byType(FilledButton), findsOneWidget);
      final context = tester.element(find.byType(FilledButton));
      expect(find.text(context.l10n.tasksDoneButtonLabel), findsOneWidget);
    });

    testWidgets('back button is positioned at the bottom', (tester) async {
      await pumpAppWithTasksList(tester, tasks: tasks);

      final buttonAlign = tester.widget<Align>(
        find.ancestor(
          of: find.byType(FilledButton),
          matching: find.byType(Align),
        ),
      );

      expect(buttonAlign.alignment, Alignment.bottomCenter);
    });
  });
}
