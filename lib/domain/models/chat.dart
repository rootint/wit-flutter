import 'package:json_annotation/json_annotation.dart';

import 'message.dart';

part 'chat.g.dart';

@JsonSerializable()
class Chat {
  final String id;
  final String topicId;
  final String question;
  final bool isOver;
  final List<Message> messages;

  Chat({
    required this.id,
    required this.topicId,
    required this.isOver,
    required this.messages,
    required this.question,
  });

  Map<String, dynamic> toJson() => _$ChatToJson(this);
  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}

