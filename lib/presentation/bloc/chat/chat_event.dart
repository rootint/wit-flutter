part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class GetChatEvent extends ChatEvent {
  final int topicId;
  final int courseId;

  GetChatEvent(this.topicId, this.courseId);
}