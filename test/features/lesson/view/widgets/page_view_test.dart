import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:lessons_tasks_assignment/domain/content_component.dart';
import 'package:lessons_tasks_assignment/domain/page.dart';
import 'package:lessons_tasks_assignment/features/lesson/view/widgets/page_view.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/helpers.dart';
import '../../../../mocks.mocks.dart';

void main() {
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

  testWidgets('renders text component', (tester) async {
    await tester.pumpApp(
      locale: const Locale('de'),
      widget: const LessonPageView(
        page: Page(
          content: [
            TextComponent(text: {'en': 'Hello', 'de': 'Hallo'}),
          ],
        ),
      ),
    );
    expect(find.text('Hallo'), findsOneWidget);
  });
  testWidgets('renders image component', (tester) async {
    await tester.pumpApp(
      widget: LessonPageView(
        page: Page(
          content: [
            ImageComponent(
              imageUri: Uri.parse('https://example.com/image.jpg'),
            ),
          ],
        ),
      ),
    );
    expect(find.byType(CachedNetworkImage), findsOneWidget);
  });

  testWidgets('renders multiple components', (WidgetTester tester) async {
    await tester.pumpApp(
      widget: LessonPageView(
        page: Page(
          content: [
            const TextComponent(text: {'en': 'Hello', 'de': 'Hallo'}),
            ImageComponent(
              imageUri: Uri.parse('https://example.com/image.jpg'),
            ),
          ],
        ),
      ),
    );
    expect(find.text('Hallo'), findsOneWidget);
    expect(find.byType(CachedNetworkImage), findsOneWidget);
  });
}
