import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:lessons_tasks_assignment/data/repositories/challenges/challenges_repository.dart';
import 'package:lessons_tasks_assignment/data/repositories/concepts/concepts_repository.dart';
import 'package:lessons_tasks_assignment/domain/challenge.dart';
import 'package:lessons_tasks_assignment/domain/concept.dart';
import 'package:lessons_tasks_assignment/features/challenges/challenges_route.dart';
import 'package:lessons_tasks_assignment/features/challenges/view/challenges_view.dart';
import 'package:lessons_tasks_assignment/features/concepts/concepts_route.dart';
import 'package:lessons_tasks_assignment/routing/go_router.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/helpers.dart';
import '../../mocks.mocks.dart';

void main() {
  late MockChallengesRepository mockChallengesRepository;
  late MockConceptsRepository mockConceptsRepository;
  const testConceptId = 'test_concept_id';

  const mockChallenges = <Challenge>[];
  const mockConcept = Concept(
    id: testConceptId,
    title: {'de': 'Test Concept', 'en': 'Test Concept'},
    sections: [],
    challengeIds: [],
  );

  setUp(() {
    mockChallengesRepository = MockChallengesRepository();
    mockConceptsRepository = MockConceptsRepository();

    when(mockChallengesRepository.getChallenges())
        .thenAnswer((_) async => mockChallenges);
    when(mockConceptsRepository.getConcepts()).thenAnswer(
      (_) async => [mockConcept],
    );

    GetIt.I.registerSingleton<ChallengesRepository>(mockChallengesRepository);
    GetIt.I.registerSingleton<ConceptsRepository>(mockConceptsRepository);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  Future<void> pumpTestWidget(WidgetTester tester) async {
    await tester.pumpAppWithRouter(
      router: router(
        initialLocation: const ChallengesRoute(
          id: testConceptId,
        ).location,
      ),
    );
    await tester.pumpAndSettle();
  }

  group(ChallengesRoute, () {
    testWidgets('renders $ChallengesView and fetches challenges',
        (tester) async {
      await pumpTestWidget(tester);

      expect(find.byType(ChallengesView), findsOneWidget);

      verify(mockChallengesRepository.getChallenges()).called(1);
      verify(mockConceptsRepository.getConcepts()).called(greaterThan(0));
    });
  });
}
