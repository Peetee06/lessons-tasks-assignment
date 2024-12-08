import 'package:flutter/material.dart' hide Page;
import 'package:flutter_test/flutter_test.dart';
import 'package:lessons_tasks_assignment/domain/content_component.dart';
import 'package:lessons_tasks_assignment/domain/page.dart';
import 'package:lessons_tasks_assignment/features/lesson/view/widgets/page_view.dart';
import 'package:lessons_tasks_assignment/features/lesson/view/widgets/pages_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../helpers/helpers.dart';

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
          pages: pages,
          hasTasks: hasTasks,
        ),
      );
    }

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

    testWidgets('back button is disabled on first page',
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

    testWidgets('forward button is disabled on last page',
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

    testWidgets('back and forward buttons are disabled when only one page',
        (WidgetTester tester) async {
      await pumpTestWidget(tester, pages: [const Page(content: [])]);
      expect(find.byKey(LessonPagesView.backButtonKey), findsNothing);
      expect(find.byKey(LessonPagesView.forwardButtonKey), findsNothing);
    });

    testWidgets('navigation between pages works', (WidgetTester tester) async {
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
  });
}
