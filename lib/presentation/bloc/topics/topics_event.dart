part of 'topics_bloc.dart';

abstract class TopicsEvent extends Equatable {
  const TopicsEvent();

  @override
  List<Object> get props => [];
}

class GetTopicsEvent extends TopicsEvent {
  final String courseId;

  const GetTopicsEvent(this.courseId);
}
