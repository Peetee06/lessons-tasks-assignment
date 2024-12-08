import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lessons_tasks_assignment/features/tasks/cubit/tasks_cubit.dart';
import 'package:lessons_tasks_assignment/features/tasks/cubit/tasks_state.dart';
import 'package:lessons_tasks_assignment/features/tasks/view/widgets/tasks_list.dart';

class TasksView extends StatelessWidget {
  const TasksView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: switch (state) {
            TasksInitial() => const SizedBox.shrink(),
            TasksLoading() => const Center(child: CircularProgressIndicator()),
            TasksError(:final message) => Center(child: Text(message)),
            TasksLoaded(:final tasks) => TasksList(tasks: tasks),
          },
        );
      },
    );
  }
}
