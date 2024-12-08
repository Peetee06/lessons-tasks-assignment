import 'package:flutter/material.dart' hide Page;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lessons_tasks_assignment/domain/content_component.dart';
import 'package:lessons_tasks_assignment/domain/lesson.dart';
import 'package:lessons_tasks_assignment/domain/page.dart';
import 'package:lessons_tasks_assignment/features/lesson/cubit/lesson_cubit.dart';
import 'package:lessons_tasks_assignment/features/lesson/cubit/lesson_state.dart';
import 'package:lessons_tasks_assignment/features/lesson/view/lesson_view.dart';
import 'package:lessons_tasks_assignment/features/lesson/view/widgets/pages_view.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/helpers.dart';
import '../../../mocks.mocks.dart';

void main() {
  provideDummy(const LessonState.initial());
  late MockLessonCubit cubit;

  setUp(() {
    cubit = MockLessonCubit();
    when(cubit.stream).thenAnswer((_) => const Stream.empty());
  });

  Future<void> pumpTestWidget(
    WidgetTester tester, {
    Locale? locale,
  }) {
    return tester.pumpApp(
      locale: locale,
      widget: BlocProvider<LessonCubit>.value(
        value: cubit,
        child: const LessonView(),
      ),
    );
  }

  group('LessonView', () {
    testWidgets('renders AppBar in initial state', (WidgetTester tester) async {
      when(cubit.state).thenReturn(const LessonInitial());
      await pumpTestWidget(tester);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('renders progress indicator while loading',
        (WidgetTester tester) async {
      when(cubit.state).thenReturn(const LessonLoading());
      await pumpTestWidget(tester);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets(
      'renders error message when error occurs',
      (WidgetTester tester) async {
        when(cubit.state).thenReturn(const LessonError('error'));
        await pumpTestWidget(tester);
        expect(find.text('error'), findsOneWidget);
        expect(find.byType(AppBar), findsOneWidget);
      },
    );

    testWidgets('passes pages to LessonPagesView', (WidgetTester tester) async {
      const lesson = Lesson(
        id: '1',
        title: {'en': 'Test Lesson', 'de': 'Test Lektion'},
        pages: [
          Page(
            content: [
              TextComponent(text: {'en': 'Hello', 'de': 'Hallo'}),
            ],
          ),
        ],
        taskIds: [],
      );
      when(cubit.state).thenReturn(const LessonLoaded(lesson));
      await pumpTestWidget(tester);
      final pagesView =
          tester.widget<LessonPagesView>(find.byType(LessonPagesView));
      expect(pagesView.pages, lesson.pages);
    });

    testWidgets('passes false to LessonPagesView when no tasks',
        (WidgetTester tester) async {
      const lesson = Lesson(
        id: '1',
        title: {'en': 'Test Lesson', 'de': 'Test Lektion'},
        pages: [],
        taskIds: [],
      );
      when(cubit.state).thenReturn(const LessonLoaded(lesson));
      await pumpTestWidget(tester);
      final pagesView =
          tester.widget<LessonPagesView>(find.byType(LessonPagesView));
      expect(pagesView.hasTasks, false);
    });

    testWidgets('passes true to LessonPagesView when tasks',
        (WidgetTester tester) async {
      const lesson = Lesson(
        id: '1',
        title: {'en': 'Test Lesson', 'de': 'Test Lektion'},
        pages: [],
        taskIds: ['1'],
      );
      when(cubit.state).thenReturn(const LessonLoaded(lesson));
      await pumpTestWidget(tester);
      final pagesView =
          tester.widget<LessonPagesView>(find.byType(LessonPagesView));
      expect(pagesView.hasTasks, true);
    });
  });
}
