import 'package:go_router/go_router.dart';
import 'package:lessons_tasks_assignment/features/concepts/concepts_route.dart';

GoRouter router({String? initialLocation}) => GoRouter(
      initialLocation: initialLocation ?? ConceptsRoute().location,
      routes: $appRoutes,
    );
