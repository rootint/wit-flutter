// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['id'] as String,
      title: json['title'] as String,
      source: json['source'] as String,
      topicsCompleted: json['topicsCompleted'] as int,
      topicsTotal: json['topicsTotal'] as int,
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'source': instance.source,
      'topicsTotal': instance.topicsTotal,
      'topicsCompleted': instance.topicsCompleted,
    };
