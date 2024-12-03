import 'package:flutter_test/flutter_test.dart';
import 'package:lessons_tasks_assignment/domain/content_component.dart';
import 'package:lessons_tasks_assignment/domain/page.dart';

void main() {
  group('Page', () {
    test('should be deserialized from JSON', () {
      const json = {
        'content': [
          {
            'type': 'text',
            'text': {'de': 'Hallo', 'en': 'Hello'},
          },
          {
            'type': 'image',
            'imageUri': 'https://example.com/image.png',
          },
        ],
      };

      final page = Page.fromJson(json);
      final expected = Page(
        content: [
          const TextComponent(
            text: {'de': 'Hallo', 'en': 'Hello'},
          ),
          ImageComponent(
            imageUri: Uri.parse('https://example.com/image.png'),
          ),
        ],
      );

      expect(page, expected);
    });

    test('should throw an exception if content is missing', () {
      const json = <String, dynamic>{};
      expect(
        () => Page.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });

    test('should throw an exception if content is not a list', () {
      const json = {'content': 'not_a_list'};
      expect(
        () => Page.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });
  });
}
