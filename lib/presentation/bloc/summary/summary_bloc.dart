import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_app/domain/repositories/main_repo.dart';

import '../../../domain/models/summary.dart';

part 'summary_event.dart';
part 'summary_state.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  final MainRepo repo;
  SummaryBloc(this.repo) : super(SummaryLoading()) {
    on<GetSummaryEvent>((event, emit) async {
      emit(SummaryLoading());
      final response = await repo.getSummary(event.topicId);
      emit(SummaryLoaded(response));
    });
  }
}
