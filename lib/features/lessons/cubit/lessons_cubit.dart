import 'package:bloc/bloc.dart';
import 'package:lessons_tasks_assignment/features/lessons/cubit/lessons_state.dart';
import 'package:lessons_tasks_assignment/repositories/lessons/lessons_repository.dart';

class LessonsCubit extends Cubit<LessonsState> {
  LessonsCubit(this.lessonsRepository) : super(const LessonsState.initial());
  final LessonsRepository lessonsRepository;

  Future<void> fetchLessons() async {
    try {
      emit(const LessonsState.loading());
      final lessons = await lessonsRepository.getLessons();
      emit(LessonsState.loaded(lessons));
    } catch (error, stackTrace) {
      emit(const LessonsState.error('Failed to fetch lessons'));
      addError(error, stackTrace);
    }
  }
}
