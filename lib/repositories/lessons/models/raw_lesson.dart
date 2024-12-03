import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lessons_tasks_assignment/domain/page.dart';

part 'raw_lesson.freezed.dart';
part 'raw_lesson.g.dart';

@freezed
class RawLesson with _$RawLesson {
  const factory RawLesson({
    required String id,
    required Map<String, String> title,
    required List<Page> pages,
    required List<String> taskIds,
  }) = _RawLesson;

  factory RawLesson.fromJson(Map<String, dynamic> json) =>
      _$RawLessonFromJson(json);
}
