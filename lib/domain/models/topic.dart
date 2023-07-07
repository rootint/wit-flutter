import 'package:json_annotation/json_annotation.dart';

part 'topic.g.dart';

@JsonSerializable()
class Topic {
  final String id;
  final String title;
  final String courseId;
  final int questionsTotal;
  final int questionsCompleted;
  final int number;

  Topic({
    required this.id,
    required this.title, 
    required this.courseId,
    required this.questionsTotal,
    required this.questionsCompleted,
    required this.number,
  });

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);
  Map<String, dynamic> toJson() => _$TopicToJson(this);
}