import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lessons_tasks_assignment/common/extensions/localizations_extension.dart';
import 'package:lessons_tasks_assignment/features/lesson/lesson_route.dart';
import 'package:lessons_tasks_assignment/features/lessons/cubit/lessons_cubit.dart';
import 'package:lessons_tasks_assignment/features/lessons/cubit/lessons_state.dart';
import 'package:lessons_tasks_assignment/features/lessons/lessons_route.dart';
import 'package:lessons_tasks_assignment/l10n/l10n.dart';

class LessonsPage extends StatelessWidget {
  const LessonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.lessonsPageTitle),
      ),
      body: BlocBuilder<LessonsCubit, LessonsState>(
        builder: (context, state) {
          return switch (state) {
            LessonsInitial() => const SizedBox.shrink(),
            LessonsLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            LessonsLoaded(:final lessons) => RefreshIndicator(
                onRefresh: () => context.read<LessonsCubit>().fetchLessons(),
                child: lessons.isEmpty
                    ? Center(
                        child: Text(context.l10n.lessonsEmpty),
                      )
                    : ListView.separated(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: lessons.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          final lesson = lessons[index];
                          return ListTile(
                            title: Text(
                              lesson.title.localizedTo(
                                Localizations.localeOf(context),
                              ),
                            ),
                            subtitle: Text(
                              context.l10n.lessonsPages(
                                lesson.pages.length,
                              ),
                            ),
                            trailing: Chip(
                              label: Text(
                                context.l10n.lessonsTasks(
                                  lesson.tasks.length,
                                ),
                              ),
                            ),
                            onTap: () => LessonRoute(
                              id: lesson.id,
                            ).go(context),
                          );
                        },
                      ),
              ),
            LessonsError(:final message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(message),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<LessonsCubit>().fetchLessons(),
                      child: Text(context.l10n.lessonsTryAgain),
                    ),
                  ],
                ),
              ),
          };
        },
      ),
    );
  }
}
