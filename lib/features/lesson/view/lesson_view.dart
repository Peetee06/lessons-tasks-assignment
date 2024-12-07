import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lessons_tasks_assignment/features/lesson/cubit/lesson_cubit.dart';
import 'package:lessons_tasks_assignment/features/lesson/cubit/lesson_state.dart';

class LessonView extends StatelessWidget {
  const LessonView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonCubit, LessonState>(
      builder: (context, state) {
        return switch (state) {
          LessonLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}
