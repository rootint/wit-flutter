import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_app/domain/repositories/main_repo.dart';

import '../../../domain/models/message.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final MainRepo repo;
  Map<int, List<Message>> chats = {};

  ChatBloc(this.repo) : super(ChatLoading()) {
    on<CreateChatEvent>(_createChatHandler);
    on<GetChatEvent>(_getChatHandler);
    on<SendMessageEvent>(_sendMessageHandler);
  }

  Future<void> _createChatHandler(
      CreateChatEvent event, Emitter<ChatState> emit) async {
    emit(ChatLoading());
    final response = await repo.createChat(event.topicId);
  }

  Future<void> _getChatHandler(
      GetChatEvent event, Emitter<ChatState> emit) async {
    emit(ChatLoading());
    print(event.topicId);
    final response = await repo.getMessages(event.topicId, event.questionId);
    chats[event.topicId] = response;
    emit(ChatLoaded(response));
  }

  Future<void> _sendMessageHandler(
      SendMessageEvent event, Emitter<ChatState> emit) async {
    // emit(ChatLoading());
    print(event.topicId);
    print('Response sent!');
    emit(QuestionLoading(chats[event.topicId]!));
    final response = await repo.sendReceiveMessage(
      event.topicId,
      event.questionId,
      event.text,
    );
    print('Response received!');
    Message msgSent = Message(sentByUser: 1, text: event.text);
    Message msgReceive = Message(sentByUser: 0, text: response.answer);
    chats[event.topicId]!.add(msgSent);
    chats[event.topicId]!.add(msgReceive);
    emit(ChatLoaded(chats[event.topicId]!));
  }
}
