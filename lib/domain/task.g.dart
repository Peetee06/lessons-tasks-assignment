// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as String,
      question: Map<String, String>.from(json['question'] as Map),
      options: (json['options'] as List<dynamic>)
          .map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
      correctAnswerIds: (json['correctAnswerIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'options': instance.options,
      'correctAnswerIds': instance.correctAnswerIds,
    };
