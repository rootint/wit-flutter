import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  @JsonKey(name: 'message')
  final String text;
  @JsonKey(name: 'sent_by_user')
  final int sentByUser;

  Message({
    required this.sentByUser,
    required this.text,
  });

  Map<String, dynamic> toJson() => _$MessageToJson(this);
  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}
