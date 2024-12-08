import 'package:flutter_test/flutter_test.dart';
import 'package:lessons_tasks_assignment/domain/content_component.dart';
import 'package:lessons_tasks_assignment/domain/lesson.dart';
import 'package:lessons_tasks_assignment/domain/page.dart';

void main() {
  group('Lesson', () {
    test('should be deserialized from JSON', () {
      const json = {
        'id': 'lesson1',
        'title': {'en': 'Lesson 1', 'de': 'Lektion 1'},
        'pages': [
          {
            'content': [
              {
                'type': 'text',
                'text': {'de': 'Hallo', 'en': 'Hello'},
              },
            ],
          },
        ],
        'taskIds': ['task1', 'task2'],
      };

      final lesson = Lesson.fromJson(json);
      const expected = Lesson(
        id: 'lesson1',
        title: {'en': 'Lesson 1', 'de': 'Lektion 1'},
        pages: [
          Page(
            content: [
              TextComponent(
                text: {'de': 'Hallo', 'en': 'Hello'},
              ),
            ],
          ),
        ],
        taskIds: ['task1', 'task2'],
      );

      expect(lesson, expected);
    });

    test('should throw an exception if id is missing', () {
      const json = {
        'title': {'en': 'Lesson 1', 'de': 'Lektion 1'},
        'pages': <Page>[],
        'taskIds': <String>[],
      };
      expect(
        () => Lesson.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });

    test('should throw an exception if title is missing', () {
      const json = {
        'id': 'lesson1',
        'pages': <Page>[],
        'taskIds': <String>[],
      };
      expect(
        () => Lesson.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });

    test('should throw an exception if title is not a map', () {
      const json = {
        'id': 'lesson1',
        'title': 'Lesson 1',
        'pages': <Page>[],
        'taskIds': <String>[],
      };
      expect(
        () => Lesson.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });

    test('should throw an exception if pages is missing', () {
      const json = {
        'id': 'lesson1',
        'title': {'en': 'Lesson 1', 'de': 'Lektion 1'},
        'taskIds': <String>[],
      };
      expect(
        () => Lesson.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });

    test('should throw an exception if taskIds is missing', () {
      const json = {
        'id': 'lesson1',
        'title': {'en': 'Lesson 1', 'de': 'Lektion 1'},
        'pages': <Page>[],
      };
      expect(
        () => Lesson.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });
  });
}
