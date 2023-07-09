import 'package:json_annotation/json_annotation.dart';

part 'course.g.dart';

@JsonSerializable()
class Course {
  final String id;
  @JsonKey(name: 'name')
  final String title;
  @JsonKey(name: 'source_url')
  final String source;
  @JsonKey(name: 'topics_amount')
  final int topicsTotal;
  @JsonKey(name: 'topics_completed')
  final int topicsCompleted;

  Course({
    required this.id,
    required this.title, 
    required this.source,
    required this.topicsCompleted,
    required this.topicsTotal,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
