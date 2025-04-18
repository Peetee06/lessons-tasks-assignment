import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lessons_tasks_assignment/features/challenges/cubit/challenges_cubit.dart';
import 'package:lessons_tasks_assignment/features/challenges/cubit/challenges_state.dart';
import 'package:lessons_tasks_assignment/features/challenges/view/widgets/challenges_list.dart';

class ChallengesView extends StatelessWidget {
  const ChallengesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChallengesCubit, ChallengesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: switch (state) {
            ChallengesInitial() => const SizedBox.shrink(),
            ChallengesLoading() =>
              const Center(child: CircularProgressIndicator()),
            ChallengesError(:final message) => Center(child: Text(message)),
            ChallengesLoaded(:final challenges) =>
              ChallengesList(challenges: challenges),
          },
        );
      },
    );
  }
}
