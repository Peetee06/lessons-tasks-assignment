import 'package:flutter_test/flutter_test.dart';
import 'package:lessons_tasks_assignment/data/repositories/tasks/tasks_repository.dart';
import 'package:lessons_tasks_assignment/domain/answer.dart';
import 'package:lessons_tasks_assignment/domain/task.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks.mocks.dart';

void main() {
  late MockRestClient restClient;

  setUp(() {
    restClient = MockRestClient();
  });

  test('getTasks returns a list of tasks', () async {
    when(restClient.getTasks()).thenAnswer(
      (_) async => [
        const Task(
          id: '1',
          question: {
            'en': 'What is the capital of France?',
            'de': 'Was ist die Hauptstadt von Frankreich?',
          },
          options: [
            Answer(id: 'a1', text: {'en': 'Paris', 'de': 'Paris'}),
            Answer(id: 'a2', text: {'en': 'London', 'de': 'London'}),
            Answer(id: 'a3', text: {'en': 'Berlin', 'de': 'Berlin'}),
          ],
          correctAnswerIds: ['a1'],
        ),
        const Task(
          id: '2',
          question: {
            'en': 'Which colors are in the German flag?',
            'de': 'Welche Farben sind in der deutschen Flagge?',
          },
          options: [
            Answer(id: 'b1', text: {'en': 'Black', 'de': 'Schwarz'}),
            Answer(id: 'b2', text: {'en': 'Red', 'de': 'Rot'}),
            Answer(id: 'b3', text: {'en': 'Gold', 'de': 'Gold'}),
          ],
          correctAnswerIds: ['b1', 'b2', 'b3'],
        ),
      ],
    );
    final repository = TasksRepository(
      restClient: restClient,
    );

    final tasks = await repository.getTasks();

    expect(
      tasks,
      [
        const Task(
          id: '1',
          question: {
            'en': 'What is the capital of France?',
            'de': 'Was ist die Hauptstadt von Frankreich?',
          },
          options: [
            Answer(id: 'a1', text: {'en': 'Paris', 'de': 'Paris'}),
            Answer(id: 'a2', text: {'en': 'London', 'de': 'London'}),
            Answer(id: 'a3', text: {'en': 'Berlin', 'de': 'Berlin'}),
          ],
          correctAnswerIds: ['a1'],
        ),
        const Task(
          id: '2',
          question: {
            'en': 'Which colors are in the German flag?',
            'de': 'Welche Farben sind in der deutschen Flagge?',
          },
          options: [
            Answer(id: 'b1', text: {'en': 'Black', 'de': 'Schwarz'}),
            Answer(id: 'b2', text: {'en': 'Red', 'de': 'Rot'}),
            Answer(id: 'b3', text: {'en': 'Gold', 'de': 'Gold'}),
          ],
          correctAnswerIds: ['b1', 'b2', 'b3'],
        ),
      ],
    );
  });
}
