import 'package:bloc/bloc.dart';
import 'package:lessons_tasks_assignment/data/repositories/lessons/lessons_repository.dart';
import 'package:lessons_tasks_assignment/features/lessons/cubit/lessons_state.dart';

class ConceptsCubit extends Cubit<ConceptsState> {
  ConceptsCubit(this.conceptsRepository) : super(const ConceptsState.initial());
  final ConceptsRepository conceptsRepository;

  Future<void> fetchConcepts() async {
    try {
      emit(const ConceptsState.loading());
      final concepts = await conceptsRepository.getConcepts();
      emit(ConceptsState.loaded(concepts));
    } catch (error, stackTrace) {
      emit(const ConceptsState.error('Failed to fetch concepts'));
      addError(error, stackTrace);
    }
  }
}
