import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';
import 'package:lessons_tasks_assignment/app/view/app.dart';
import 'package:lessons_tasks_assignment/features/lesson/view/lesson_view.dart';
import 'package:mockito/mockito.dart';

import '../mocks.mocks.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late MockCacheManager cacheManager;

  setUp(() async {
    cacheManager = MockCacheManager();
    when(
      cacheManager.getFileStream(
        any,
        key: anyNamed('key'),
        headers: anyNamed('headers'),
        withProgress: anyNamed('withProgress'),
      ),
    ).thenAnswer(
      (_) => const Stream<FileResponse>.empty(),
    );
    GetIt.I.registerSingleton<BaseCacheManager>(cacheManager);
  });

  tearDown(() async {
    GetIt.I.unregister<BaseCacheManager>();
  });

  group('App Integration Test', () {
    testWidgets('Lesson flow', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();

      await tester.tap(find.byType(ListTile).first);
      await tester.pumpAndSettle();

      expect(find.byType(LessonView), findsOneWidget);
    });
  });
}
