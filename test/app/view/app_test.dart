import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lessons_tasks_assignment/app/app.dart';
import 'package:lessons_tasks_assignment/l10n/l10n.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: App(),
        ),
      );
      final BuildContext context = tester.element(find.byType(App));
      expect(find.text(context.l10n.counterAppBarTitle), findsOneWidget);
    });
  });
}
