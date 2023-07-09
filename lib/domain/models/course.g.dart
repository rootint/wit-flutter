// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['id'] as String,
      title: json['name'] as String,
      source: json['source_url'] as String,
      topicsCompleted: json['topics_completed'] as int,
      topicsTotal: json['topics_amount'] as int,
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.title,
      'source_url': instance.source,
      'topics_amount': instance.topicsTotal,
      'topics_completed': instance.topicsCompleted,
    };
