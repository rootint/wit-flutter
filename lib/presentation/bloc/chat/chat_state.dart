part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();
  
  // @override
  // List<Object> get props => [];
}

class ChatLoading extends ChatState {
  @override
  List<Object> get props => [];
}

class ChatLoaded extends ChatState {
  final List<Message> messages;

  const ChatLoaded(this.messages);

  @override
  List<Object> get props => [messages];
}
