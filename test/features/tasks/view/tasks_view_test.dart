import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lessons_tasks_assignment/domain/answer.dart';
import 'package:lessons_tasks_assignment/domain/task.dart';
import 'package:lessons_tasks_assignment/features/tasks/cubit/tasks_cubit.dart';
import 'package:lessons_tasks_assignment/features/tasks/cubit/tasks_state.dart';
import 'package:lessons_tasks_assignment/features/tasks/view/tasks_view.dart';
import 'package:lessons_tasks_assignment/features/tasks/view/widgets/tasks_list.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/helpers.dart';
import '../../../mocks.mocks.dart';

void main() {
  provideDummy(const TasksState.initial());
  late MockTasksCubit cubit;

  setUp(() {
    cubit = MockTasksCubit();
    when(cubit.stream).thenAnswer((_) => const Stream.empty());
  });

  Future<void> pumpTestWidget(WidgetTester tester) {
    return tester.pumpApp(
      widget: BlocProvider<TasksCubit>.value(
        value: cubit,
        child: const TasksView(),
      ),
    );
  }

  group('TasksView', () {
    testWidgets('renders initial state', (WidgetTester tester) async {
      when(cubit.state).thenReturn(const TasksState.initial());
      await pumpTestWidget(tester);
      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('renders loading state', (WidgetTester tester) async {
      when(cubit.state).thenReturn(const TasksState.loading());
      await pumpTestWidget(tester);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('passes tasks to TasksList', (WidgetTester tester) async {
      final tasks = [
        const Task(
          id: '1',
          question: {
            'en': 'Test Task',
            'de': 'Test Aufgabe',
          },
          options: [
            Answer(
              id: '1',
              text: {
                'en': 'Test Option',
                'de': 'Test Beschreibung',
              },
            ),
          ],
          correctAnswerIds: ['1'],
        ),
      ];
      when(cubit.state).thenReturn(TasksState.loaded(tasks));
      await pumpTestWidget(tester);
      final tasksList = tester.widget<TasksList>(find.byType(TasksList));
      expect(tasksList.tasks, tasks);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('renders error state', (WidgetTester tester) async {
      when(cubit.state).thenReturn(const TasksState.error('Error'));
      await pumpTestWidget(tester);
      expect(find.text('Error'), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });
  });
}
