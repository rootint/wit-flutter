part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class GetChatEvent extends ChatEvent {
  final int topicId;
  final int questionId;

  const GetChatEvent(this.topicId, this.questionId);
}

class SendMessageEvent extends ChatEvent {
  final int topicId;
  final int questionId;
  final String text;

  const SendMessageEvent(
    this.topicId,
    this.questionId,
    this.text,
  );
}
