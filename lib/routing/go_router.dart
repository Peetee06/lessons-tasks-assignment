import 'package:go_router/go_router.dart';
import 'package:lessons_tasks_assignment/features/lessons/lessons_route.dart';

final router = GoRouter(
  initialLocation: ConceptsRoute().location,
  routes: $appRoutes,
);
