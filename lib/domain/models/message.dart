import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  final String id;
  final String text;
  final bool sentByUser;

  Message({
    required this.id,
    required this.sentByUser,
    required this.text,
  });

  Map<String, dynamic> toJson() => _$MessageToJson(this);
  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}
