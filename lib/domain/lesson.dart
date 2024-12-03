import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lessons_tasks_assignment/common/typedefs.dart';
import 'package:lessons_tasks_assignment/domain/page.dart';
import 'package:lessons_tasks_assignment/domain/task.dart';

part 'lesson.freezed.dart';

@freezed
class Lesson with _$Lesson {
  const factory Lesson({
    required String id,
    required Localizations title,
    required List<Page> pages,
    required List<Task> tasks,
  }) = _Lesson;
}
