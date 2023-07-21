import 'package:json_annotation/json_annotation.dart';

part 'create_course_dto.g.dart';

@JsonSerializable()
class CreateCourseDto {
  @JsonKey(name: 'source_url')
  final String youtubeURL;
  

  CreateCourseDto({
    required this.youtubeURL
  });

  Map<String, dynamic> toJson() => _$CreateCourseDtoToJson(this);
  factory CreateCourseDto.fromJson(Map<String, dynamic> json) => _$CreateCourseDtoFromJson(json);
}

