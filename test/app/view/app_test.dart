import 'package:flutter_test/flutter_test.dart';
import 'package:lessons_tasks_assignment/app/app.dart';
import 'package:lessons_tasks_assignment/features/lessons/view/lessons_page.dart';

import '../../helpers/helpers.dart';

void main() {
  group('App', () {
    testWidgets('renders LessonsPage', (tester) async {
      await tester.pumpApp(
        widget: const App(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(LessonsPage), findsOneWidget);
    });
  });
}
