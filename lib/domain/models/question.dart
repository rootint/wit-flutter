import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';

@JsonSerializable()
class Question {
  final String id;
  final String text;

  Question({
    required this.id,
    required this.text,
  });

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
}

