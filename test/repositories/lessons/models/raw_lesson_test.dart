import 'package:flutter_test/flutter_test.dart';
import 'package:lessons_tasks_assignment/domain/content_component.dart';
import 'package:lessons_tasks_assignment/domain/page.dart';
import 'package:lessons_tasks_assignment/repositories/lessons/models/raw_lesson.dart';

void main() {
  group('RawLesson', () {
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

      final rawLesson = RawLesson.fromJson(json);
      const expected = RawLesson(
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

      expect(rawLesson, expected);
    });

    test('should throw an exception if id is missing', () {
      const json = {
        'title': {'en': 'Lesson 1', 'de': 'Lektion 1'},
        'pages': <Page>[],
        'taskIds': <String>[],
      };
      expect(
        () => RawLesson.fromJson(json),
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
        () => RawLesson.fromJson(json),
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
        () => RawLesson.fromJson(json),
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
        () => RawLesson.fromJson(json),
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
        () => RawLesson.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });
  });
}
