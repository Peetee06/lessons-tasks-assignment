import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lessons_tasks_assignment/l10n/l10n.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp({required Widget widget, Locale? locale}) {
    return pumpWidget(
      MaterialApp(
        locale: locale ?? const Locale('de'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: widget,
      ),
    );
  }
}
