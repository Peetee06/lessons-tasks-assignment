import 'package:flutter/material.dart' hide Page;
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:lessons_tasks_assignment/domain/content_component.dart';
import 'package:lessons_tasks_assignment/domain/page.dart';
import 'package:lessons_tasks_assignment/features/lesson/view/widgets/page_view.dart';
import 'package:lessons_tasks_assignment/features/lesson/view/widgets/pages_view.dart';
import 'package:lessons_tasks_assignment/features/lessons/lessons_route.dart';
import 'package:lessons_tasks_assignment/features/tasks/tasks_route.dart';
import 'package:lessons_tasks_assignment/l10n/l10n.dart';
import 'package:mockito/mockito.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../helpers/helpers.dart';
import '../../../../mocks.mocks.dart';

void main() {
  group('LessonPagesView', () {
    Future<void> pumpTestWidget(
      WidgetTester tester, {
      required List<Page> pages,
      bool hasTasks = false,
      Locale? locale,
    }) {
      return tester.pumpApp(
        locale: locale,
        widget: LessonPagesView(
          id: 'id',
          pages: pages,
          hasTasks: hasTasks,
        ),
      );
    }

    testWidgets('renders no pages text when pages is empty',
        (WidgetTester tester) async {
      await pumpTestWidget(tester, pages: []);
      final context = tester.element(find.byType(LessonPagesView));
      expect(find.text(context.l10n.lessonPageEmpty), findsOneWidget);
    });

    testWidgets('renders LessonPageView and passes current page',
        (WidgetTester tester) async {
      const pages = [
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
      ];
      await pumpTestWidget(
        tester,
        pages: pages,
      );
      final pageView = tester.widget<LessonPageView>(
        find.byType(LessonPageView),
      );
      expect(pageView.page, pages.first);

      await tester.tap(find.byKey(LessonPagesView.forwardButtonKey));
      await tester.pumpAndSettle();
      final updatedPageView = tester.widget<LessonPageView>(
        find.byType(LessonPageView),
      );
      expect(updatedPageView.page, pages.last);
    });

    testWidgets('renders smooth page indicator', (WidgetTester tester) async {
      await pumpTestWidget(
        tester,
        pages: [
          const Page(content: []),
          const Page(content: []),
        ],
      );
      final smoothIndicator = tester.widget<SmoothIndicator>(
        find.byType(SmoothIndicator),
      );
      expect(
        smoothIndicator.count,
        [
          const Page(content: []),
          const Page(content: []),
        ].length,
      );
      expect(smoothIndicator.offset, 0);
      await tester.tap(find.byKey(LessonPagesView.forwardButtonKey));
      await tester.pumpAndSettle();

      final updatedSmoothIndicator = tester.widget<SmoothIndicator>(
        find.byType(SmoothIndicator),
      );
      expect(updatedSmoothIndicator.offset, 1);
    });

    testWidgets('hides smooth page indicator when pages is empty',
        (WidgetTester tester) async {
      await pumpTestWidget(tester, pages: []);
      expect(find.byType(SmoothIndicator), findsNothing);
    });

    testWidgets('renders task icon when hasTasks is true',
        (WidgetTester tester) async {
      await pumpTestWidget(tester, pages: [], hasTasks: true);
      expect(find.byIcon(Icons.task_outlined), findsOneWidget);
    });

    testWidgets('hides task icon by default', (WidgetTester tester) async {
      await pumpTestWidget(tester, pages: []);
      expect(find.byIcon(Icons.task_outlined), findsNothing);
    });

    testWidgets('hides task icon when hasTasks is false',
        (WidgetTester tester) async {
      // ignore: avoid_redundant_argument_values
      await pumpTestWidget(tester, pages: [], hasTasks: false);
      expect(find.byIcon(Icons.task_outlined), findsNothing);
    });

    testWidgets('has separator when hasTasks is true and pages is not empty',
        (WidgetTester tester) async {
      await pumpTestWidget(
        tester,
        pages: [const Page(content: [])],
        hasTasks: true,
      );
      final row = tester.widget<Row>(find.byType(Row).first);
      expect(
        row.children.any((child) => child is SizedBox),
        true,
      );
    });

    testWidgets('hides separator when hasTasks is false and pages is not empty',
        (WidgetTester tester) async {
      await pumpTestWidget(tester, pages: [const Page(content: [])]);
      final row = tester.widget<Row>(find.byType(Row).first);
      expect(
        row.children.any((child) => child is SizedBox),
        false,
      );
    });

    testWidgets('hides separator when hasTasks is true and pages is empty',
        (WidgetTester tester) async {
      await pumpTestWidget(tester, pages: [], hasTasks: true);
      final row = tester.widget<Row>(find.byType(Row).first);
      expect(
        row.children.any((child) => child is SizedBox),
        false,
      );
    });

    testWidgets('hides separator when hasTasks is false and pages is empty',
        (WidgetTester tester) async {
      await pumpTestWidget(tester, pages: []);
      final row = tester.widget<Row>(find.byType(Row).first);
      expect(
        row.children.any((child) => child is SizedBox),
        false,
      );
    });

    testWidgets('back button is hidden on first page',
        (WidgetTester tester) async {
      await pumpTestWidget(
        tester,
        pages: [
          const Page(content: []),
          const Page(content: []),
        ],
      );
      expect(find.byKey(LessonPagesView.backButtonKey), findsNothing);
      expect(find.byKey(LessonPagesView.forwardButtonKey), findsOneWidget);
    });

    testWidgets('forward button is hidden on last page when no tasks',
        (WidgetTester tester) async {
      await pumpTestWidget(
        tester,
        pages: [
          const Page(content: []),
          const Page(content: []),
        ],
      );
      await tester.tap(find.byKey(LessonPagesView.forwardButtonKey));
      await tester.pumpAndSettle();
      expect(find.byKey(LessonPagesView.forwardButtonKey), findsNothing);
      expect(find.byKey(LessonPagesView.backButtonKey), findsOneWidget);
    });

    testWidgets(
        'back and forward buttons are hidden when only one page and no tasks',
        (WidgetTester tester) async {
      await pumpTestWidget(tester, pages: [const Page(content: [])]);
      expect(find.byKey(LessonPagesView.backButtonKey), findsNothing);
      expect(find.byKey(LessonPagesView.forwardButtonKey), findsNothing);
    });

    testWidgets('navigation between pages works when no tasks',
        (WidgetTester tester) async {
      await pumpTestWidget(
        tester,
        pages: [
          const Page(content: []),
          const Page(content: []),
          const Page(content: []),
        ],
      );
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

    group('navigates to tasks when', () {
      late MockGoRouter router;
      setUp(() {
        router = MockGoRouter();
        when(router.go(any)).thenAnswer((_) {});
      });

      Future<void> pumpWithGoRouter(
        WidgetTester tester, {
        required List<Page> pages,
      }) {
        return tester.pumpWidget(
          MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: InheritedGoRouter(
              goRouter: router,
              child: LessonPagesView(
                id: 'id',
                pages: pages,
                hasTasks: true,
              ),
            ),
          ),
        );
      }

      testWidgets(
          'forward button is pressed on last page when hasTasks is true',
          (WidgetTester tester) async {
        await pumpWithGoRouter(
          tester,
          pages: [
            const Page(content: []),
            const Page(content: []),
          ],
        );

        await tester.tap(find.byKey(LessonPagesView.forwardButtonKey));
        await tester.pumpAndSettle();

        expect(find.byKey(LessonPagesView.forwardButtonKey), findsOneWidget);
        expect(find.byKey(LessonPagesView.backButtonKey), findsOneWidget);

        await tester.tap(find.byKey(LessonPagesView.forwardButtonKey));
        verify(router.go(const TasksRoute(id: 'id').location)).called(1);
      });

      testWidgets(
          'forward button is pressed on first page when hasTasks is true',
          (WidgetTester tester) async {
        await pumpWithGoRouter(
          tester,
          pages: [
            const Page(content: []),
          ],
        );

        await tester.tap(find.byKey(LessonPagesView.forwardButtonKey));
        await tester.pumpAndSettle();

        verify(router.go(const TasksRoute(id: 'id').location)).called(1);
      });

      testWidgets(
          'forward button is pressed with no pages when hasTasks is true',
          (WidgetTester tester) async {
        await pumpWithGoRouter(
          tester,
          pages: [],
        );

        await tester.tap(find.byKey(LessonPagesView.forwardButtonKey));
        await tester.pumpAndSettle();

        verify(router.go(const TasksRoute(id: 'id').location)).called(1);
      });
    });
  });
}
