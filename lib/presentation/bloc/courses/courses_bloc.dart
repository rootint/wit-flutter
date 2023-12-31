import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_app/domain/repositories/main_repo.dart';

import '../../../domain/models/course.dart';

part 'courses_event.dart';
part 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  final MainRepo repo;

  Map<int, Course> courses = {};

  CoursesBloc({required this.repo}) : super(CoursesLoading()) {
    on<GetCoursesEvent>(_getCoursesHandler);
    on<CreateCourseEvent>(_createCourseHandler);
  }

  Future<void> _getCoursesHandler(
      GetCoursesEvent event, Emitter<CoursesState> emit) async {
    emit(CoursesLoading());
    final response = await repo.getCoursesList();
    // response.map((e) => courses[e.id] = e);
    for (var e in response) {
      courses[e.id] = e;
    }
    emit(CoursesLoaded(response));
  }

  Future<void> _createCourseHandler(
      CreateCourseEvent event, Emitter<CoursesState> emit) async {
    emit(CoursesLoading());
    final r = await repo.createCourse(event.youtubeURL);
    final response = await repo.getCoursesList();
    // response.map((e) => courses[e.id] = e);
    for (var e in response) {
      courses[e.id] = e;
    }
    emit(CoursesLoaded(response));
    // response.map((e) => courses[e.id] = e);
    // emit(CoursesLoaded(courses.values.toList()));
    // for (var e in response) {
    //   courses[e.id] = e;
    // }
    // emit(CoursesLoaded(response));
  }
}
