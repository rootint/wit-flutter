import 'package:json_annotation/json_annotation.dart';

part 'course.g.dart';

@JsonSerializable()
class Course {
  final String id;
  final String title;
  final String source;
  final int topicsTotal;
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
