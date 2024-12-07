import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lessons_tasks_assignment/domain/answer.dart';
import 'package:lessons_tasks_assignment/domain/content_component.dart';
import 'package:lessons_tasks_assignment/domain/lesson.dart';
import 'package:lessons_tasks_assignment/domain/page.dart';
import 'package:lessons_tasks_assignment/domain/task.dart';
import 'package:lessons_tasks_assignment/features/lesson/cubit/lesson_cubit.dart';
import 'package:lessons_tasks_assignment/features/lesson/cubit/lesson_state.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks.mocks.dart';

void main() {
  late MockLessonsRepository mockRepository;

  setUp(() {
    mockRepository = MockLessonsRepository();
  });

  final lesson = Lesson(
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
    tasks: [
      const Task(
        id: '1',
        question: {
          'en': 'Test Task',
          'de': 'Test Aufgabe',
        },
        options: [
          Answer(
            id: 'a1',
            text: {
              'en': 'Option 1',
              'de': 'Option 1',
            },
          ),
        ],
        correctAnswerIds: ['a1'],
      ),
    ],
  );

  group('LessonCubit', () {
    test('initial state is LessonInitial', () {
      expect(
        LessonCubit(mockRepository).state,
        const LessonState.initial(),
      );
    });

    blocTest<LessonCubit, LessonState>(
      'emits [loading, loaded] when fetchLesson succeeds',
      setUp: () {
        when(mockRepository.getLessons()).thenAnswer((_) async => [lesson]);
      },
      build: () => LessonCubit(mockRepository),
      act: (cubit) => cubit.fetchLesson('1'),
      expect: () => [
        const LessonState.loading(),
        LessonState.loaded(lesson),
      ],
    );

    blocTest<LessonCubit, LessonState>(
      'emits [loading, error] when fetchLesson fails',
      setUp: () {
        when(mockRepository.getLessons()).thenThrow(Exception('Test error'));
      },
      build: () => LessonCubit(mockRepository),
      act: (cubit) => cubit.fetchLesson('1'),
      expect: () => const [
        LessonState.loading(),
        LessonState.error('Failed to fetch lesson'),
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

    blocTest<LessonCubit, LessonState>(
      'emits [loading, error] when lesson does not exist',
      setUp: () {
        when(mockRepository.getLessons()).thenAnswer((_) async => []);
      },
      build: () => LessonCubit(mockRepository),
      act: (cubit) => cubit.fetchLesson('nonexistent'),
      expect: () => const [
        LessonState.loading(),
        LessonState.error('Lesson not found'),
      ],
      verify: (_) {
        verify(mockRepository.getLessons()).called(1);
      },
    );
  });
}
