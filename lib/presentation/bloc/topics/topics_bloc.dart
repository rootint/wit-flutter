import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'topics_event.dart';
part 'topics_state.dart';

class TopicsBloc extends Bloc<TopicsEvent, TopicsState> {
  TopicsBloc() : super(TopicsInitial()) {
    on<TopicsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
