import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lessons_tasks_assignment/common/typedefs.dart';
import 'package:lessons_tasks_assignment/domain/section.dart';

part 'concept.freezed.dart';
part 'concept.g.dart';

@freezed
class Concept with _$Concept {
  const factory Concept({
    required String id,
    required Localizations title,
    required List<Section> sections,
    required List<String> challengeIds,
  }) = _Concept;

  factory Concept.fromJson(Map<String, dynamic> json) =>
      _$ConceptFromJson(json);
}
