part of 'summary_bloc.dart';

abstract class SummaryState extends Equatable {
  const SummaryState();

  @override
  List<Object> get props => [];
}

class SummaryLoading extends SummaryState {}

class SummaryLoaded extends SummaryState {
  final Summary summary;

  const SummaryLoaded(this.summary);
}
