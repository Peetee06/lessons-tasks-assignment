import 'package:flutter/material.dart' hide Page;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lessons_tasks_assignment/domain/content_component.dart';
import 'package:lessons_tasks_assignment/domain/lesson.dart';
import 'package:lessons_tasks_assignment/domain/page.dart';
import 'package:lessons_tasks_assignment/features/lesson/cubit/lesson_cubit.dart';
import 'package:lessons_tasks_assignment/features/lesson/cubit/lesson_state.dart';
import 'package:lessons_tasks_assignment/features/lesson/view/lesson_view.dart';
import 'package:lessons_tasks_assignment/features/lesson/view/widgets/page_view.dart';
import 'package:lessons_tasks_assignment/features/lesson/view/widgets/pages_view.dart';
import 'package:mockito/mockito.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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

    testWidgets('renders LessonPageView and passes current page',
        (WidgetTester tester) async {
      const lesson = Lesson(
        id: '1',
        title: {
          'en': 'title',
          'de': 'Titel',
        },
        pages: [
          Page(
            content: [
              ContentComponent.text(
                text: {
                  'en': 'text',
                  'de': 'Text',
                },
              ),
            ],
          ),
          Page(
            content: [
              ContentComponent.text(
                text: {
                  'en': 'text2',
                  'de': 'Text2',
                },
              ),
            ],
          ),
        ],
        tasks: [],
      );
      when(cubit.state).thenReturn(const LessonLoaded(lesson));
      await pumpTestWidget(tester, locale: const Locale('de'));
      expect(find.text('Titel'), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      final pageView = tester.widget<LessonPageView>(
        find.byType(LessonPageView),
      );
      expect(pageView.page, lesson.pages.first);

      await tester.tap(find.byKey(LessonPagesView.forwardButtonKey));
      await tester.pumpAndSettle();
      final updatedPageView = tester.widget<LessonPageView>(
        find.byType(LessonPageView),
      );
      expect(updatedPageView.page, lesson.pages.last);
    });

    testWidgets('renders smooth page indicator', (WidgetTester tester) async {
      const lesson = Lesson(
        id: '1',
        title: {
          'en': 'title',
          'de': 'Titel',
        },
        pages: [
          Page(content: []),
          Page(content: []),
        ],
        tasks: [],
      );
      when(cubit.state).thenReturn(const LessonLoaded(lesson));
      await pumpTestWidget(tester, locale: const Locale('de'));
      final smoothIndicator = tester.widget<SmoothIndicator>(
        find.byType(SmoothIndicator),
      );
      expect(smoothIndicator.count, lesson.pages.length);
      expect(smoothIndicator.offset, 0);
      await tester.tap(find.byKey(LessonPagesView.forwardButtonKey));
      await tester.pumpAndSettle();

      final updatedSmoothIndicator = tester.widget<SmoothIndicator>(
        find.byType(SmoothIndicator),
      );
      expect(updatedSmoothIndicator.offset, 1);
    });

    testWidgets('back button is disabled on first page',
        (WidgetTester tester) async {
      const lesson = Lesson(
        id: '1',
        title: {
          'en': 'title',
          'de': 'Titel',
        },
        pages: [
          Page(content: []),
          Page(content: []),
        ],
        tasks: [],
      );
      when(cubit.state).thenReturn(const LessonLoaded(lesson));
      await pumpTestWidget(tester, locale: const Locale('de'));
      expect(find.byKey(LessonPagesView.backButtonKey), findsNothing);
      expect(find.byKey(LessonPagesView.forwardButtonKey), findsOneWidget);
    });

    testWidgets('forward button is disabled on last page',
        (WidgetTester tester) async {
      const lesson = Lesson(
        id: '1',
        title: {
          'en': 'title',
          'de': 'Titel',
        },
        pages: [
          Page(content: []),
          Page(content: []),
        ],
        tasks: [],
      );
      when(cubit.state).thenReturn(const LessonLoaded(lesson));
      await pumpTestWidget(tester, locale: const Locale('de'));
      await tester.tap(find.byKey(LessonPagesView.forwardButtonKey));
      await tester.pumpAndSettle();
      expect(find.byKey(LessonPagesView.forwardButtonKey), findsNothing);
      expect(find.byKey(LessonPagesView.backButtonKey), findsOneWidget);
    });

    testWidgets('back and forward buttons are disabled when only one page',
        (WidgetTester tester) async {
      const lesson = Lesson(
        id: '1',
        title: {
          'en': 'title',
          'de': 'Titel',
        },
        pages: [Page(content: [])],
        tasks: [],
      );
      when(cubit.state).thenReturn(const LessonLoaded(lesson));
      await pumpTestWidget(tester, locale: const Locale('de'));
      expect(find.byKey(LessonPagesView.backButtonKey), findsNothing);
      expect(find.byKey(LessonPagesView.forwardButtonKey), findsNothing);
    });

    testWidgets('navigation between pages works', (WidgetTester tester) async {
      const lesson = Lesson(
        id: '1',
        title: {
          'en': 'title',
          'de': 'Titel',
        },
        pages: [
          Page(content: []),
          Page(content: []),
          Page(content: []),
        ],
        tasks: [],
      );
      when(cubit.state).thenReturn(const LessonLoaded(lesson));
      await pumpTestWidget(tester, locale: const Locale('de'));
      expect(find.byKey(LessonPagesView.backButtonKey), findsNothing);
      expect(find.byKey(LessonPagesView.forwardButtonKey), findsOneWidget);

      await tester.tap(find.byKey(LessonPagesView.forwardButtonKey));
      await tester.pumpAndSettle();
      expect(find.byKey(LessonPagesView.backButtonKey), findsOneWidget);
      expect(find.byKey(LessonPagesView.forwardButtonKey), findsOneWidget);

      await tester.tap(find.byKey(LessonPagesView.forwardButtonKey));
      await tester.pumpAndSettle();
      expect(find.byKey(LessonPagesView.backButtonKey), findsOneWidget);
      expect(find.byKey(LessonPagesView.forwardButtonKey), findsNothing);

      await tester.tap(find.byKey(LessonPagesView.backButtonKey));
      await tester.pumpAndSettle();
      expect(find.byKey(LessonPagesView.backButtonKey), findsOneWidget);
      expect(find.byKey(LessonPagesView.forwardButtonKey), findsOneWidget);

      await tester.tap(find.byKey(LessonPagesView.backButtonKey));
      await tester.pumpAndSettle();
      expect(find.byKey(LessonPagesView.backButtonKey), findsNothing);
      expect(find.byKey(LessonPagesView.forwardButtonKey), findsOneWidget);
    });
  });
}
