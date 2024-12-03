import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lessons_tasks_assignment/domain/content_component.dart';

part 'page.freezed.dart';
part 'page.g.dart';

@freezed
class Page with _$Page {
  const factory Page({
    required List<ContentComponent> content,
  }) = _Page;

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);
}
