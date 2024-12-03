// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PageImpl _$$PageImplFromJson(Map<String, dynamic> json) => _$PageImpl(
      content: (json['content'] as List<dynamic>)
          .map((e) => ContentComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PageImplToJson(_$PageImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
    };
