import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/models/course.dart';

part 'courses_event.dart';
part 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  
  CoursesBloc() : super(CoursesLoading()) {
    on<GetCoursesEvent>(_getCoursesHandler);
  }

  Future<void> _getCoursesHandler(GetCoursesEvent event, Emitter<CoursesState> emit) async {
    emit(CoursesLoading());
  }
}
