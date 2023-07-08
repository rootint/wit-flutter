import 'package:json_annotation/json_annotation.dart';
import 'package:learning_app/domain/models/question.dart';

part 'topic.g.dart';

@JsonSerializable()
class Topic {
  final String id;
  final String title;
  final String courseId;
  final int questionsTotal;
  final List<Question> questions;

  Topic({
    required this.id,
    required this.title, 
    required this.courseId,
    required this.questionsTotal,
    required this.questions
  });

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);
  Map<String, dynamic> toJson() => _$TopicToJson(this);
}