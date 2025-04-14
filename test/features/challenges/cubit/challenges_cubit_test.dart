import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lessons_tasks_assignment/domain/answer.dart';
import 'package:lessons_tasks_assignment/domain/challenge.dart';
import 'package:lessons_tasks_assignment/domain/concept.dart';
import 'package:lessons_tasks_assignment/features/challenges/cubit/challenges_cubit.dart';
import 'package:lessons_tasks_assignment/features/challenges/cubit/challenges_state.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks.mocks.dart';

void main() {
  late MockChallengesRepository mockChallengesRepository;
  late MockConceptsRepository mockConceptsRepository;

  setUp(() {
    mockChallengesRepository = MockChallengesRepository();
    mockConceptsRepository = MockConceptsRepository();
  });

  final challenges = [
    const Challenge(
      id: '1',
      question: {
        'en': 'What is 2+2?',
        'de': 'Was ist 2+2?',
      },
      options: [
        Answer(id: 'a1', text: {'en': 'Four', 'de': 'Vier'}),
        Answer(id: 'a2', text: {'en': 'Five', 'de': 'Fünf'}),
      ],
      correctAnswerIds: ['a1'],
    ),
    const Challenge(
      id: '2',
      question: {
        'en': 'What is the capital of France?',
        'de': 'Was ist die Hauptstadt von Frankreich?',
      },
      options: [
        Answer(id: 'b1', text: {'en': 'Paris', 'de': 'Paris'}),
        Answer(id: 'b2', text: {'en': 'London', 'de': 'London'}),
      ],
      correctAnswerIds: ['b1'],
    ),
  ];

  final concepts = [
    Concept(
      id: '1',
      title: {'en': 'Concept 1', 'de': 'Konzept 1'},
      sections: [],
      challengeIds: [challenges.first.id],
    ),
    const Concept(
      id: 'conceptWithMissingChallenge',
      title: {'en': 'Concept 2', 'de': 'Konzept 2'},
      sections: [],
      challengeIds: ['3'],
    ),
  ];

  group('ChallengesCubit', () {
    test('initial state is ChallengesInitial', () {
      expect(
        ChallengesCubit(
          challengesRepository: mockChallengesRepository,
          conceptsRepository: mockConceptsRepository,
          conceptId: '1',
        ).state,
        const ChallengesState.initial(),
      );
    });

    blocTest<ChallengesCubit, ChallengesState>(
      'emits [loading, loaded] when fetchChallenges succeeds',
      setUp: () {
        when(mockChallengesRepository.getChallenges())
            .thenAnswer((_) async => challenges);
        when(mockConceptsRepository.getConcepts()).thenAnswer(
          (_) async => concepts,
        );
      },
      build: () => ChallengesCubit(
        challengesRepository: mockChallengesRepository,
        conceptsRepository: mockConceptsRepository,
        conceptId: '1',
      ),
      act: (cubit) => cubit.fetchChallenges(),
      expect: () => [
        const ChallengesState.loading(),
        ChallengesState.loaded([challenges.first]),
      ],
    );

    blocTest<ChallengesCubit, ChallengesState>(
      'emits [loading, error] when requested challenge is not found',
      setUp: () {
        when(mockChallengesRepository.getChallenges())
            .thenAnswer((_) async => challenges);
        when(mockConceptsRepository.getConcepts()).thenAnswer(
          (_) async => concepts,
        );
      },
      build: () => ChallengesCubit(
        challengesRepository: mockChallengesRepository,
        conceptsRepository: mockConceptsRepository,
        conceptId: 'conceptWithMissingChallenge',
      ),
      act: (cubit) => cubit.fetchChallenges(),
      expect: () => const [
        ChallengesState.loading(),
        ChallengesState.error('Challenge with id 3 not found'),
      ],
      errors: () => [
        isA<Exception>().having(
          (e) => e.toString(),
          'error',
          'Exception: Challenge with id 3 not found',
        ),
      ],
    );

    blocTest<ChallengesCubit, ChallengesState>(
      'emits [loading, error] when concept is not found',
      setUp: () {
        when(mockConceptsRepository.getConcepts()).thenAnswer(
          (_) async => [],
        );
      },
      build: () => ChallengesCubit(
        challengesRepository: mockChallengesRepository,
        conceptsRepository: mockConceptsRepository,
        conceptId: 'missingConcept',
      ),
      act: (cubit) => cubit.fetchChallenges(),
      expect: () => const [
        ChallengesState.loading(),
        ChallengesState.error('Concept with id missingConcept not found'),
      ],
      errors: () => [
        isA<Exception>().having(
          (e) => e.toString(),
          'error',
          'Exception: Concept with id missingConcept not found',
        ),
      ],
    );

    blocTest<ChallengesCubit, ChallengesState>(
      'emits [loading, error] when fetchChallenges fails',
      setUp: () {
        when(mockConceptsRepository.getConcepts()).thenAnswer(
          (_) async => concepts,
        );
        when(mockChallengesRepository.getChallenges())
            .thenThrow(Exception('Test error'));
      },
      build: () => ChallengesCubit(
        challengesRepository: mockChallengesRepository,
        conceptsRepository: mockConceptsRepository,
        conceptId: '1',
      ),
      act: (cubit) => cubit.fetchChallenges(),
      expect: () => const [
        ChallengesState.loading(),
        ChallengesState.error('Failed to fetch challenges'),
      ],
      verify: (_) {
        verify(mockChallengesRepository.getChallenges()).called(1);
      },
      errors: () => [
        isA<Exception>().having(
          (e) => e.toString(),
          'error',
          'Exception: Test error',
        ),
      ],
    );

    blocTest<ChallengesCubit, ChallengesState>(
      'emits [loading, error] when fetchConcepts fails',
      setUp: () {
        when(mockConceptsRepository.getConcepts()).thenThrow(
          Exception('Test error'),
        );
      },
      build: () => ChallengesCubit(
        challengesRepository: mockChallengesRepository,
        conceptsRepository: mockConceptsRepository,
        conceptId: '1',
      ),
      act: (cubit) => cubit.fetchChallenges(),
      expect: () => const [
        ChallengesState.loading(),
        ChallengesState.error('Failed to fetch challenges'),
      ],
      verify: (_) {
        verify(mockConceptsRepository.getConcepts()).called(1);
      },
      errors: () => [
        isA<Exception>().having(
          (e) => e.toString(),
          'error',
          'Exception: Test error',
        ),
      ],
    );
  });
}
