import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lessons_tasks_assignment/domain/answer.dart';
import 'package:lessons_tasks_assignment/domain/task.dart';
import 'package:lessons_tasks_assignment/features/tasks/cubit/tasks_cubit.dart';
import 'package:lessons_tasks_assignment/features/tasks/cubit/tasks_state.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks.mocks.dart';

void main() {
  late MockTasksRepository mockRepository;

  setUp(() {
    mockRepository = MockTasksRepository();
  });

  final tasks = [
    const Task(
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
    const Task(
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

  group('TasksCubit', () {
    test('initial state is TasksInitial', () {
      expect(
        TasksCubit(mockRepository, taskIds: const ['1']).state,
        const TasksState.initial(),
      );
    });

    blocTest<TasksCubit, TasksState>(
      'emits [loading, loaded] when fetchTasks succeeds',
      setUp: () {
        when(mockRepository.getTasks()).thenAnswer((_) async => tasks);
      },
      build: () => TasksCubit(mockRepository, taskIds: const ['1']),
      act: (cubit) => cubit.fetchTasks(),
      expect: () => [
        const TasksState.loading(),
        TasksState.loaded([tasks[0]]),
      ],
    );

    blocTest<TasksCubit, TasksState>(
      'emits [loading, error] when requested task is not found',
      setUp: () {
        when(mockRepository.getTasks()).thenAnswer((_) async => tasks);
      },
      build: () => TasksCubit(mockRepository, taskIds: const ['3']),
      act: (cubit) => cubit.fetchTasks(),
      expect: () => const [
        TasksState.loading(),
        TasksState.error('Task with id 3 not found'),
      ],
      errors: () => [
        isA<Exception>().having(
          (e) => e.toString(),
          'error',
          'Exception: Task with id 3 not found',
        ),
      ],
    );

    blocTest<TasksCubit, TasksState>(
      'emits [loading, error] when fetchTasks fails',
      setUp: () {
        when(mockRepository.getTasks()).thenThrow(Exception('Test error'));
      },
      build: () => TasksCubit(mockRepository, taskIds: const ['1']),
      act: (cubit) => cubit.fetchTasks(),
      expect: () => const [
        TasksState.loading(),
        TasksState.error('Failed to fetch tasks'),
      ],
      verify: (_) {
        verify(mockRepository.getTasks()).called(1);
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
