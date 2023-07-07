// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Topic _$TopicFromJson(Map<String, dynamic> json) => Topic(
      id: json['id'] as String,
      title: json['title'] as String,
      courseId: json['courseId'] as String,
      questionsTotal: json['questionsTotal'] as int,
      questionsCompleted: json['questionsCompleted'] as int,
      number: json['number'] as int,
    );

Map<String, dynamic> _$TopicToJson(Topic instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'courseId': instance.courseId,
      'questionsTotal': instance.questionsTotal,
      'questionsCompleted': instance.questionsCompleted,
      'number': instance.number,
    };
