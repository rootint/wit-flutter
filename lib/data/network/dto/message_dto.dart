import 'package:json_annotation/json_annotation.dart';

part 'message_dto.g.dart';

@JsonSerializable()
class MessageDto {
  @JsonKey(name: 'question_id')
  final int questionId;
  final String answer;

  MessageDto({
    required this.questionId,
    required this.answer,
  });

  Map<String, dynamic> toJson() => _$MessageDtoToJson(this);
  factory MessageDto.fromJson(Map<String, dynamic> json) => _$MessageDtoFromJson(json);
}

