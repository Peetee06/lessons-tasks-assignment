import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lessons_tasks_assignment/common/extensions/localizations_extension.dart';
import 'package:lessons_tasks_assignment/features/lesson/cubit/lesson_cubit.dart';
import 'package:lessons_tasks_assignment/features/lesson/cubit/lesson_state.dart';
import 'package:lessons_tasks_assignment/features/lesson/view/widgets/pages_view.dart';

class ConceptView extends StatelessWidget {
  const ConceptView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConceptCubit, ConceptState>(
      builder: (context, state) {
        return Scaffold(
          appBar: switch (state) {
            ConceptLoaded(:final concept) => AppBar(
                title: Text(
                  concept.title.localizedTo(
                    Localizations.localeOf(context),
                  ),
                ),
              ),
            _ => AppBar(),
          },
          body: switch (state) {
            ConceptInitial() => const SizedBox.shrink(),
            ConceptLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            ConceptError(:final message) => Center(
                child: Text(message),
              ),
            ConceptLoaded(:final concept) => ConceptSectionsView(
                id: concept.id,
                sections: concept.sections,
                hasChallenges: concept.challengeIds.isNotEmpty,
              ),
          },
        );
      },
    );
  }
}
