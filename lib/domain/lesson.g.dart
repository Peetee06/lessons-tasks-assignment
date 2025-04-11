// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConceptImpl _$$ConceptImplFromJson(Map<String, dynamic> json) =>
    _$ConceptImpl(
      id: json['id'] as String,
      title: Map<String, String>.from(json['title'] as Map),
      pages: (json['pages'] as List<dynamic>)
          .map((e) => Section.fromJson(e as Map<String, dynamic>))
          .toList(),
      taskIds:
          (json['taskIds'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ConceptImplToJson(_$ConceptImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'pages': instance.pages,
      'taskIds': instance.taskIds,
    };
