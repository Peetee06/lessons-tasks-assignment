import 'package:flutter_test/flutter_test.dart';
import 'package:lessons_tasks_assignment/domain/answer.dart';
import 'package:lessons_tasks_assignment/domain/task.dart';

void main() {
  group('Task', () {
    test('should be deserialized from JSON', () {
      const json = {
        'id': 'task1',
        'title': {
          'en': 'Choose correct answer',
          'de': 'Wähle die richtige Antwort',
        },
        'options': [
          {
            'id': 'answer1',
            'text': {'en': 'Yes', 'de': 'Ja'},
          },
          {
            'id': 'answer2',
            'text': {'en': 'No', 'de': 'Nein'},
          },
        ],
        'correctAnswerIds': ['answer1'],
      };

      final task = Task.fromJson(json);
      const expected = Task(
        id: 'task1',
        title: {
          'en': 'Choose correct answer',
          'de': 'Wähle die richtige Antwort',
        },
        options: [
          Answer(
            id: 'answer1',
            text: {'en': 'Yes', 'de': 'Ja'},
          ),
          Answer(
            id: 'answer2',
            text: {'en': 'No', 'de': 'Nein'},
          ),
        ],
        correctAnswerIds: ['answer1'],
      );

      expect(task, expected);
    });

    test('should throw an exception if id is missing', () {
      const json = {
        'title': {
          'en': 'Choose correct answer',
          'de': 'Wähle die richtige Antwort',
        },
        'options': <Answer>[],
        'correctAnswerIds': <String>[],
      };
      expect(
        () => Task.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });

    test('should throw an exception if title is missing', () {
      const json = {
        'id': 'task1',
        'options': <Answer>[],
        'correctAnswerIds': <String>[],
      };
      expect(
        () => Task.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });

    test('should throw an exception if options is missing', () {
      const json = {
        'id': 'task1',
        'title': {
          'en': 'Choose correct answer',
          'de': 'Wähle die richtige Antwort',
        },
        'correctAnswerIds': <String>[],
      };
      expect(
        () => Task.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });

    test('should throw an exception if correctAnswerIds is missing', () {
      const json = {
        'id': 'task1',
        'title': {
          'en': 'Choose correct answer',
          'de': 'Wähle die richtige Antwort',
        },
        'options': <Answer>[],
      };
      expect(
        () => Task.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });

    test('should handle empty options and correctAnswerIds lists', () {
      const json = {
        'id': 'task1',
        'title': {
          'en': 'Choose correct answer',
          'de': 'Wähle die richtige Antwort',
        },
        'options': <Answer>[],
        'correctAnswerIds': <String>[],
      };

      final task = Task.fromJson(json);
      const expected = Task(
        id: 'task1',
        title: {
          'en': 'Choose correct answer',
          'de': 'Wähle die richtige Antwort',
        },
        options: [],
        correctAnswerIds: [],
      );

      expect(task, expected);
    });
  });
}
