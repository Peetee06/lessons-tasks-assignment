import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lessons_tasks_assignment/common/extensions/localizations_extension.dart';
import 'package:lessons_tasks_assignment/features/lesson/cubit/lesson_cubit.dart';
import 'package:lessons_tasks_assignment/features/lesson/cubit/lesson_state.dart';
import 'package:lessons_tasks_assignment/features/lesson/view/widgets/pages_view.dart';

class LessonView extends StatelessWidget {
  const LessonView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonCubit, LessonState>(
      builder: (context, state) {
        return Scaffold(
          appBar: switch (state) {
            LessonLoaded(:final lesson) => AppBar(
                title: Text(
                  lesson.title.localizedTo(
                    Localizations.localeOf(context),
                  ),
                ),
              ),
            _ => AppBar(),
          },
          body: switch (state) {
            LessonInitial() => const SizedBox.shrink(),
            LessonLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            LessonError(:final message) => Center(
                child: Text(message),
              ),
            LessonLoaded(:final lesson) => LessonPagesView(
                id: lesson.id,
                pages: lesson.pages,
                hasTasks: lesson.taskIds.isNotEmpty,
              ),
          },
        );
      },
    );
  }
}
