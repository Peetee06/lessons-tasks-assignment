import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lessons_tasks_assignment/domain/content_component.dart';
import 'package:lessons_tasks_assignment/domain/lesson.dart';
import 'package:lessons_tasks_assignment/domain/page.dart';
import 'package:lessons_tasks_assignment/features/lessons/cubit/lessons_cubit.dart';
import 'package:lessons_tasks_assignment/features/lessons/cubit/lessons_state.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks.mocks.dart';

void main() {
  late MockLessonsRepository mockRepository;

  setUp(() {
    mockRepository = MockLessonsRepository();
  });

  final lessons = [
    Lesson(
      id: '1',
      title: {
        'en': 'Test Lesson',
        'de': 'Test Lektion',
      },
      pages: [
        Page(
          content: [
            const ContentComponent.text(
              text: {
                'en': 'Hello',
                'de': 'Hallo',
              },
            ),
            ContentComponent.image(
              imageUri: Uri.parse('https://example.com/image.jpg'),
            ),
          ],
        ),
      ],
      taskIds: ['1'],
    ),
  ];

  group('LessonsCubit', () {
    test('initial state is LessonsInitial', () {
      expect(
        LessonsCubit(mockRepository).state,
        const LessonsState.initial(),
      );
    });

    blocTest<LessonsCubit, LessonsState>(
      'emits [loading, loaded] when fetchLessons succeeds',
      setUp: () {
        when(mockRepository.getLessons()).thenAnswer((_) async => lessons);
      },
      build: () => LessonsCubit(mockRepository),
      act: (cubit) => cubit.fetchLessons(),
      expect: () => [
        const LessonsState.loading(),
        LessonsState.loaded(lessons),
      ],
    );

    blocTest<LessonsCubit, LessonsState>(
      'emits [loading, error] when fetchLessons fails',
      setUp: () {
        when(mockRepository.getLessons()).thenThrow(Exception('Test error'));
      },
      build: () => LessonsCubit(mockRepository),
      act: (cubit) => cubit.fetchLessons(),
      expect: () => const [
        LessonsState.loading(),
        LessonsState.error('Failed to fetch lessons'),
      ],
      verify: (_) {
        verify(mockRepository.getLessons()).called(1);
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
