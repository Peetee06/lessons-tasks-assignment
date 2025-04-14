import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:lessons_tasks_assignment/data/repositories/lessons/lessons_repository.dart';
import 'package:lessons_tasks_assignment/domain/lesson.dart';
import 'package:lessons_tasks_assignment/features/lesson/lesson_route.dart';
import 'package:lessons_tasks_assignment/features/lesson/view/lesson_view.dart';
import 'package:lessons_tasks_assignment/features/lessons/lessons_route.dart';
import 'package:lessons_tasks_assignment/routing/go_router.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/helpers.dart';
import '../../mocks.mocks.dart';

void main() {
  late MockConceptsRepository mockConceptsRepository;
  const testConceptId = 'test_concept_id';

  const mockConcept = Concept(
    id: testConceptId,
    title: {
      'de': 'Test Concept',
      'en': 'Test Concept',
    },
    sections: [],
    challengeIds: [],
  );

  setUp(() {
    mockConceptsRepository = MockConceptsRepository();

    when(mockConceptsRepository.getConcepts())
        .thenAnswer((_) async => [mockConcept]);

    GetIt.I.registerSingleton<ConceptsRepository>(mockConceptsRepository);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  Future<void> pumpTestWidget(WidgetTester tester) async {
    await tester.pumpAppWithRouter(
      router: router(
        initialLocation: const ConceptRoute(
          id: testConceptId,
        ).location,
      ),
    );
    await tester.pumpAndSettle();
  }

  group(ConceptRoute, () {
    testWidgets('renders $ConceptView and fetches concept', (tester) async {
      await pumpTestWidget(tester);

      expect(find.byType(ConceptView), findsOneWidget);

      // Called twice, because ConceptsRoute is stacked on ConceptRoute
      // and both call getConcepts
      verify(mockConceptsRepository.getConcepts()).called(2);
    });
  });
}
