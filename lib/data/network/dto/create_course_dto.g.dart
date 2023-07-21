// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_course_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCourseDto _$CreateCourseDtoFromJson(Map<String, dynamic> json) =>
    CreateCourseDto(
      youtubeURL: json['source_url'] as String,
    );

Map<String, dynamic> _$CreateCourseDtoToJson(CreateCourseDto instance) =>
    <String, dynamic>{
      'source_url': instance.youtubeURL,
    };
