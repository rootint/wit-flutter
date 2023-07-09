import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_app/domain/repositories/main_repo.dart';

import '../../../domain/models/topic.dart';

part 'topics_event.dart';
part 'topics_state.dart';

class TopicsBloc extends Bloc<TopicsEvent, TopicsState> {
  final MainRepo repo;
  TopicsBloc(this.repo) : super(TopicsLoading()) {
    on<GetTopicsEvent>(_getTopicsHandler);
  }

  Future<void> _getTopicsHandler(
      GetTopicsEvent event, Emitter<TopicsState> emit) async {
    emit(TopicsLoading());
    final response = await repo.getCourseTopics(event.courseId);
    emit(TopicsLoaded(response));
  }
}
