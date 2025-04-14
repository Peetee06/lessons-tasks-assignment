import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:lessons_tasks_assignment/data/repositories/lessons/lessons_repository.dart';
import 'package:lessons_tasks_assignment/features/lessons/lessons_route.dart';
import 'package:lessons_tasks_assignment/routing/go_router.dart';
import 'package:mockito/mockito.dart';

import '../mocks.mocks.dart';

void main() {
  late MockConceptsRepository mockConceptsRepository;

  setUp(() {
    mockConceptsRepository = MockConceptsRepository();
    when(mockConceptsRepository.getConcepts()).thenAnswer((_) async => []);
    GetIt.I.registerSingleton<ConceptsRepository>(mockConceptsRepository);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  group('router', () {
    final conceptsLocation = ConceptsRoute().location;

    testWidgets('uses $conceptsLocation as default initial location',
        (tester) async {
      final testRouter = router();

      expect(
        testRouter.routeInformationProvider.value.uri.toString(),
        conceptsLocation,
      );
    });

    testWidgets('uses provided initial location when specified',
        (tester) async {
      const customLocation = '/custom';
      final testRouter = router(initialLocation: customLocation);

      expect(
        testRouter.routeInformationProvider.value.uri.toString(),
        customLocation,
      );
    });
  });
}
