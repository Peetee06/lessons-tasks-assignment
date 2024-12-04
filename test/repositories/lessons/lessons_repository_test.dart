import 'package:flutter_test/flutter_test.dart';
import 'package:lessons_tasks_assignment/domain/answer.dart';
import 'package:lessons_tasks_assignment/domain/content_component.dart';
import 'package:lessons_tasks_assignment/domain/lesson.dart';
import 'package:lessons_tasks_assignment/domain/page.dart';
import 'package:lessons_tasks_assignment/domain/task.dart';
import 'package:lessons_tasks_assignment/repositories/lessons/lessons_repository.dart';
import 'package:lessons_tasks_assignment/repositories/lessons/models/raw_lesson.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.mocks.dart';

void main() {
  late MockRestClient restClient;

  setUp(() {
    restClient = MockRestClient();
  });

  test('getLessons returns a list of lessons', () async {
    when(restClient.getLessons()).thenAnswer(
      (_) async => [
        RawLesson(
          id: '1',
          title: {
            'en': 'Lesson 1',
            'de': 'Lektion 1',
          },
          pages: [
            Page(
              content: [
                ContentComponent.image(
                  imageUri: Uri.parse('https://example.com/image.png'),
                ),
                const ContentComponent.text(
                  text: {
                    'en': 'Text 1',
                    'de': 'Text 1',
                  },
                ),
              ],
            ),
          ],
          taskIds: [
            '1',
            '2',
          ],
        ),
        RawLesson(
          id: '2',
          title: {
            'en': 'Lesson 2',
            'de': 'Lektion 2',
          },
          pages: [
            Page(
              content: [
                ContentComponent.image(
                  imageUri: Uri.parse('https://example.com/image2.png'),
                ),
                const ContentComponent.text(
                  text: {
                    'en': 'Text 2',
                    'de': 'Text 2',
                  },
                ),
              ],
            ),
          ],
          taskIds: [
            '3',
            '4',
          ],
        ),
      ],
    );
    when(restClient.getTasks()).thenAnswer(
      (_) async => [
        const Task(
          id: '1',
          title: {
            'en': 'Task 1',
            'de': 'Aufgabe 1',
          },
          options: [
            Answer(
              id: '1',
              text: {
                'en': 'Option 1',
                'de': 'Option 1',
              },
            ),
            Answer(
              id: '2',
              text: {
                'en': 'Option 2',
                'de': 'Option 2',
              },
            ),
            Answer(
              id: '3',
              text: {
                'en': 'Option 3',
                'de': 'Option 3',
              },
            ),
          ],
          correctAnswerIds: ['1', '2'],
        ),
        const Task(
          id: '2',
          title: {
            'en': 'Task 2',
            'de': 'Aufgabe 2',
          },
          options: [
            Answer(
              id: '3',
              text: {
                'en': 'Option 3',
                'de': 'Option 3',
              },
            ),
            Answer(
              id: '4',
              text: {
                'en': 'Option 4',
                'de': 'Option 4',
              },
            ),
          ],
          correctAnswerIds: ['3', '4'],
        ),
        const Task(
          id: '3',
          title: {
            'en': 'Task 3',
            'de': 'Aufgabe 3',
          },
          options: [
            Answer(
              id: '5',
              text: {'en': 'Option 5', 'de': 'Option 5'},
            ),
            Answer(
              id: '6',
              text: {'en': 'Option 6', 'de': 'Option 6'},
            ),
          ],
          correctAnswerIds: ['5'],
        ),
        const Task(
          id: '4',
          title: {
            'en': 'Task 4',
            'de': 'Aufgabe 4',
          },
          options: [
            Answer(
              id: '7',
              text: {
                'en': 'Option 7',
                'de': 'Option 7',
              },
            ),
            Answer(
              id: '8',
              text: {
                'en': 'Option 8',
                'de': 'Option 8',
              },
            ),
          ],
          correctAnswerIds: ['7'],
        ),
      ],
    );
    final repository = LessonsRepository(
      restClient: restClient,
    );

    final lessons = await repository.getLessons();

    expect(
      lessons,
      [
        Lesson(
          id: '1',
          title: {'en': 'Lesson 1', 'de': 'Lektion 1'},
          pages: [
            Page(
              content: [
                ContentComponent.image(
                  imageUri: Uri.parse('https://example.com/image.png'),
                ),
                const ContentComponent.text(
                  text: {'en': 'Text 1', 'de': 'Text 1'},
                ),
              ],
            ),
          ],
          tasks: [
            const Task(
              id: '1',
              title: {'en': 'Task 1', 'de': 'Aufgabe 1'},
              options: [
                Answer(
                  id: '1',
                  text: {'en': 'Option 1', 'de': 'Option 1'},
                ),
                Answer(
                  id: '2',
                  text: {'en': 'Option 2', 'de': 'Option 2'},
                ),
                Answer(
                  id: '3',
                  text: {'en': 'Option 3', 'de': 'Option 3'},
                ),
              ],
              correctAnswerIds: ['1', '2'],
            ),
            const Task(
              id: '2',
              title: {'en': 'Task 2', 'de': 'Aufgabe 2'},
              options: [
                Answer(
                  id: '3',
                  text: {'en': 'Option 3', 'de': 'Option 3'},
                ),
                Answer(
                  id: '4',
                  text: {'en': 'Option 4', 'de': 'Option 4'},
                ),
              ],
              correctAnswerIds: ['3', '4'],
            ),
          ],
        ),
        Lesson(
          id: '2',
          title: {'en': 'Lesson 2', 'de': 'Lektion 2'},
          pages: [
            Page(
              content: [
                ContentComponent.image(
                  imageUri: Uri.parse('https://example.com/image2.png'),
                ),
                const ContentComponent.text(
                  text: {'en': 'Text 2', 'de': 'Text 2'},
                ),
              ],
            ),
          ],
          tasks: [
            const Task(
              id: '3',
              title: {'en': 'Task 3', 'de': 'Aufgabe 3'},
              options: [
                Answer(
                  id: '5',
                  text: {'en': 'Option 5', 'de': 'Option 5'},
                ),
                Answer(
                  id: '6',
                  text: {'en': 'Option 6', 'de': 'Option 6'},
                ),
              ],
              correctAnswerIds: ['5'],
            ),
            const Task(
              id: '4',
              title: {'en': 'Task 4', 'de': 'Aufgabe 4'},
              options: [
                Answer(
                  id: '7',
                  text: {'en': 'Option 7', 'de': 'Option 7'},
                ),
                Answer(
                  id: '8',
                  text: {'en': 'Option 8', 'de': 'Option 8'},
                ),
              ],
              correctAnswerIds: ['7'],
            ),
          ],
        ),
      ],
    );
  });
}
