// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestModel _$RestModelFromJson(Map<String, dynamic> json) {
  return RestModel(
    is_favourite: json['is_favourite'] as bool,
    id: json['id'] as int?,
    title: json['title'] as String?,
    description: json['description'] as String?
  );
}

Map<String, dynamic> _$RestModelToJson(RestModel instance) => <String, dynamic>{
      'is_favourite': instance.is_favourite,
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
    };
