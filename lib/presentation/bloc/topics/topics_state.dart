part of 'topics_bloc.dart';

abstract class TopicsState extends Equatable {
  const TopicsState();
  
  @override
  List<Object> get props => [];
}

class TopicsInitial extends TopicsState {}
