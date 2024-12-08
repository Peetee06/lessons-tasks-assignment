import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lessons_tasks_assignment/data/repositories/lessons/lessons_repository.dart';
import 'package:lessons_tasks_assignment/features/lesson/cubit/lesson_state.dart';

class LessonCubit extends Cubit<LessonState> {
  LessonCubit(this.lessonsRepository) : super(const LessonState.initial());
  final LessonsRepository lessonsRepository;

  Future<void> fetchLesson(String lessonId) async {
    emit(const LessonState.loading());
    try {
      final lessons = await lessonsRepository.getLessons();
      emit(
        LessonState.loaded(
          lessons.firstWhere((lesson) => lesson.id == lessonId),
        ),
      );
    } catch (error, stackTrace) {
      switch (error) {
        case StateError():
          emit(const LessonState.error('Lesson not found'));
        default:
          emit(const LessonState.error('Failed to fetch lesson'));
      }
      addError(error, stackTrace);
    }
  }
}
