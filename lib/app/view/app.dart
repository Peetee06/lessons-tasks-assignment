import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lessons_tasks_assignment/features/lessons/cubit/lessons_cubit.dart';
import 'package:lessons_tasks_assignment/features/lessons/view/lessons_page.dart';
import 'package:lessons_tasks_assignment/l10n/l10n.dart';
import 'package:lessons_tasks_assignment/repositories/lessons/interceptors/json_interceptor.dart';
import 'package:lessons_tasks_assignment/repositories/lessons/lessons_repository.dart';
import 'package:lessons_tasks_assignment/repositories/lessons/rest_client.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final lessonsRepository = LessonsRepository(
      restClient: RestClient(Dio()..interceptors.add(JsonInterceptor())),
    );
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider(
        create: (context) => LessonsCubit(lessonsRepository)..fetchLessons(),
        child: const LessonsPage(),
      ),
    );
  }
}
