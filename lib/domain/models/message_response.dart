import 'package:json_annotation/json_annotation.dart';

part 'message_response.g.dart';

@JsonSerializable()
class MessageResponse {
  @JsonKey(name: 'is_correct')
  final String answer;

  MessageResponse({
    required this.answer,
  });

  Map<String, dynamic> toJson() => _$MessageResponseToJson(this);
  factory MessageResponse.fromJson(Map<String, dynamic> json) => _$MessageResponseFromJson(json);
}

