part of 'courses_bloc.dart';

abstract class CoursesEvent extends Equatable {
  const CoursesEvent();

  @override
  List<Object> get props => [];
}

class GetCoursesEvent extends CoursesEvent {}

class CreateCourseEvent extends CoursesEvent {
  final String youtubeURL;

  const CreateCourseEvent(this.youtubeURL);
}
