import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lessons_tasks_assignment/domain/answer.dart';
import 'package:lessons_tasks_assignment/domain/content_component.dart';
import 'package:lessons_tasks_assignment/domain/page.dart';
import 'package:lessons_tasks_assignment/domain/task.dart';
import 'package:lessons_tasks_assignment/repositories/lessons/models/raw_lesson.dart';
import 'package:lessons_tasks_assignment/repositories/lessons/rest_client.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.mocks.dart';

void main() {
  group('RestClient', () {
    late MockDio mockDio;
    late RestClient restClient;

    setUp(() {
      mockDio = MockDio();
      when(mockDio.options).thenReturn(
        BaseOptions(
          baseUrl: RestClient.baseUrl,
        ),
      );
      restClient = RestClient(mockDio);
    });

    group('getLessons', () {
      test('returns list of RawLesson on successful request', () async {
        final responseData = [
          {
            'id': '1',
            'title': {'en': 'Lesson 1', 'de': 'Lektion 1'},
            'pages': [
              {
                'content': [
                  {
                    'type': 'text',
                    'text': {'en': 'Hello', 'de': 'Hallo'},
                  },
                  {
                    'type': 'image',
                    'imageUri': 'https://example.com/image.jpg',
                  },
                ],
              },
            ],
            'taskIds': ['task1', 'task2'],
          },
        ];

        when(
          mockDio.fetch<List<dynamic>>(any),
        ).thenAnswer(
          (_) async => Response(
            data: responseData,
            statusCode: 200,
            requestOptions: RequestOptions(),
          ),
        );

        final result = await restClient.getLessons();

        expect(
          result,
          [
            RawLesson(
              id: '1',
              title: {'en': 'Lesson 1', 'de': 'Lektion 1'},
              pages: [
                Page(
                  content: [
                    const ContentComponent.text(
                      text: {'en': 'Hello', 'de': 'Hallo'},
                    ),
                    ContentComponent.image(
                      imageUri: Uri.parse('https://example.com/image.jpg'),
                    ),
                  ],
                ),
              ],
              taskIds: ['task1', 'task2'],
            ),
          ],
        );
      });

      test('throws exception on error response', () async {
        when(
          mockDio.fetch<List<dynamic>>(any),
        ).thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              statusCode: 404,
              requestOptions: RequestOptions(),
            ),
          ),
        );

        expect(
          () => restClient.getLessons(),
          throwsA(isA<DioException>()),
        );
      });
    });

    group('getTasks', () {
      test('returns list of Task on successful request', () async {
        final responseData = [
          {
            'id': '1',
            'question': {'en': 'Task 1', 'de': 'Aufgabe 1'},
            'options': [
              {
                'id': 'a1',
                'text': {'en': 'Option 1', 'de': 'Option 1'},
              },
              {
                'id': 'a2',
                'text': {'en': 'Option 2', 'de': 'Option 2'},
              },
            ],
            'correctAnswerIds': ['a1'],
          },
        ];

        when(
          mockDio.fetch<List<dynamic>>(any),
        ).thenAnswer(
          (_) async => Response(
            data: responseData,
            statusCode: 200,
            requestOptions: RequestOptions(),
          ),
        );

        final result = await restClient.getTasks();

        expect(
          result,
          [
            const Task(
              id: '1',
              question: {'en': 'Task 1', 'de': 'Aufgabe 1'},
              options: [
                Answer(
                  id: 'a1',
                  text: {'en': 'Option 1', 'de': 'Option 1'},
                ),
                Answer(
                  id: 'a2',
                  text: {'en': 'Option 2', 'de': 'Option 2'},
                ),
              ],
              correctAnswerIds: ['a1'],
            ),
          ],
        );
      });

      test('throws exception on error response', () async {
        when(
          mockDio.fetch<List<dynamic>>(any),
        ).thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              statusCode: 404,
              requestOptions: RequestOptions(),
            ),
          ),
        );

        expect(
          () => restClient.getTasks(),
          throwsA(isA<DioException>()),
        );
      });
    });
  });
}
