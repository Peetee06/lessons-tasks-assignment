import 'dart:ui';

import 'package:lessons_tasks_assignment/common/typedefs.dart';

extension LocalizationsExtension on Localizations {
  String localizedTo(Locale locale) {
    return this[locale.languageCode] ?? this['de'] ?? values.first;
  }
}
