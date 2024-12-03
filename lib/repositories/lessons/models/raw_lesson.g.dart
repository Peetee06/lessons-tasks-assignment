// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raw_lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RawLessonImpl _$$RawLessonImplFromJson(Map<String, dynamic> json) =>
    _$RawLessonImpl(
      id: json['id'] as String,
      title: Map<String, String>.from(json['title'] as Map),
      pages: (json['pages'] as List<dynamic>)
          .map((e) => Page.fromJson(e as Map<String, dynamic>))
          .toList(),
      taskIds:
          (json['taskIds'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$RawLessonImplToJson(_$RawLessonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'pages': instance.pages,
      'taskIds': instance.taskIds,
    };
