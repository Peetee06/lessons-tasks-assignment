import 'package:flutter/material.dart' hide Page;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lessons_tasks_assignment/domain/content_component.dart';
import 'package:lessons_tasks_assignment/domain/lesson.dart';
import 'package:lessons_tasks_assignment/domain/page.dart';
import 'package:lessons_tasks_assignment/features/lessons/cubit/lessons_cubit.dart';
import 'package:lessons_tasks_assignment/features/lessons/cubit/lessons_state.dart';
import 'package:lessons_tasks_assignment/features/lessons/view/lessons_view.dart';
import 'package:lessons_tasks_assignment/l10n/l10n.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/helpers.dart';
import '../../../mocks.mocks.dart';

void main() {
  provideDummy(const LessonsState.initial());
  late MockLessonsCubit cubit;

  setUp(() {
    cubit = MockLessonsCubit();
    when(cubit.stream).thenAnswer((_) => const Stream.empty());
  });

  Future<void> pumpTestWidget(WidgetTester tester) {
    return tester.pumpApp(
      widget: BlocProvider<LessonsCubit>.value(
        value: cubit,
        child: const LessonsView(),
      ),
    );
  }

  group('LessonsView', () {
    testWidgets('has correct title', (WidgetTester tester) async {
      when(cubit.state).thenReturn(const LessonsState.initial());
      await pumpTestWidget(tester);
      final BuildContext context = tester.element(find.byType(LessonsView));
      expect(find.text(context.l10n.lessonsViewTitle), findsOneWidget);
    });

    testWidgets('renders initial state', (WidgetTester tester) async {
      when(cubit.state).thenReturn(const LessonsState.initial());
      await pumpTestWidget(tester);
      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('renders loading state', (WidgetTester tester) async {
      when(cubit.state).thenReturn(const LessonsState.loading());
      await pumpTestWidget(tester);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders lessons', (WidgetTester tester) async {
      final lessons = [
        Lesson(
          id: '1',
          title: {
            'en': 'Test Lesson',
            'de': 'Test Lektion',
          },
          pages: [
            Page(
              content: [
                const ContentComponent.text(
                  text: {
                    'en': 'Hello',
                    'de': 'Hallo',
                  },
                ),
                ContentComponent.image(
                  imageUri: Uri.parse('https://example.com/image.jpg'),
                ),
              ],
            ),
          ],
          taskIds: ['1'],
        ),
        const Lesson(
          id: '2',
          title: {'en': 'Test Lesson 2', 'de': 'Test Lektion 2'},
          pages: [],
          taskIds: [],
        ),
      ];
      when(cubit.state).thenReturn(LessonsState.loaded(lessons));
      await pumpTestWidget(tester);
      final BuildContext context = tester.element(find.byType(LessonsView));
      expect(find.byType(ListView), findsOneWidget);
      expect(find.text('Test Lektion'), findsOneWidget);
      expect(find.text(context.l10n.lessonsPages(1)), findsOneWidget);
      expect(find.text(context.l10n.lessonsTasks(1)), findsOneWidget);
      expect(find.text('Test Lektion 2'), findsOneWidget);
      expect(find.text(context.l10n.lessonsPages(0)), findsOneWidget);
      expect(find.text(context.l10n.lessonsTasks(0)), findsOneWidget);
    });

    testWidgets('renders error state and fetches lessons on try again tap',
        (WidgetTester tester) async {
      when(cubit.state).thenReturn(const LessonsState.error('Error'));
      await pumpTestWidget(tester);
      final BuildContext context = tester.element(find.byType(LessonsView));

      expect(find.text('Error'), findsOneWidget);
      expect(find.text(context.l10n.lessonsTryAgain), findsOneWidget);

      await tester.tap(find.text(context.l10n.lessonsTryAgain));
      verify(cubit.fetchLessons()).called(1);
    });
  });

  testWidgets('Pulling down fetches lessons', (WidgetTester tester) async {
    when(cubit.state).thenReturn(
      const LessonsState.loaded([
        Lesson(
          id: '1',
          title: {'en': 'Test Lesson', 'de': 'Test Lektion'},
          pages: [],
          taskIds: [],
        ),
      ]),
    );
    await pumpTestWidget(tester);
    await tester.drag(find.byType(ListView), const Offset(0, 500));
    await tester.pumpAndSettle();
    verify(cubit.fetchLessons()).called(1);
  });

  testWidgets('shows empty state', (WidgetTester tester) async {
    when(cubit.state).thenReturn(const LessonsState.loaded([]));
    await pumpTestWidget(tester);
    final BuildContext context = tester.element(find.byType(LessonsView));
    expect(find.text(context.l10n.lessonsEmpty), findsOneWidget);
  });
}
