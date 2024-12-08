import 'package:flutter_test/flutter_test.dart';
import 'package:lessons_tasks_assignment/data/repositories/lessons/lessons_repository.dart';
import 'package:lessons_tasks_assignment/domain/content_component.dart';
import 'package:lessons_tasks_assignment/domain/lesson.dart';
import 'package:lessons_tasks_assignment/domain/page.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks.mocks.dart';

void main() {
  late MockRestClient restClient;

  setUp(() {
    restClient = MockRestClient();
  });

  test('getLessons returns a list of lessons', () async {
    when(restClient.getLessons()).thenAnswer(
      (_) async => [
        Lesson(
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
          taskIds: ['1', '2'],
        ),
        Lesson(
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
          taskIds: ['3', '4'],
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
          taskIds: ['1', '2'],
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
          taskIds: ['3', '4'],
        ),
      ],
    );
  });
}
