part of 'summary_bloc.dart';

abstract class SummaryEvent extends Equatable {
  const SummaryEvent();

  @override
  List<Object> get props => [];
}

class GetSummaryEvent extends SummaryEvent {
  final int topicId;

  const GetSummaryEvent(this.topicId);
}