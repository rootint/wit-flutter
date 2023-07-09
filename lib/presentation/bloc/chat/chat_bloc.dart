import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_app/domain/repositories/main_repo.dart';

import '../../../domain/models/topic.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final MainRepo repo;
  ChatBloc(this.repo) : super(ChatLoading()) {
    on<GetChatEvent>(_getChatHandler);
  }

  Future<void> _getChatHandler(
      GetChatEvent event, Emitter<ChatState> emit) async {
    emit(ChatLoading());
    print(event.topicId);
    print(event.courseId);
    final response = await repo.getMessages(event.topicId, event.courseId);
    emit(ChatLoaded(response));
  }
}
