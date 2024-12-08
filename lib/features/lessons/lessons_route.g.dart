// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessons_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $lessonsRoute,
    ];

RouteBase get $lessonsRoute => GoRouteData.$route(
      path: '/lessons',
      name: 'lessons',
      factory: $LessonsRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: ':id',
          name: 'lesson',
          factory: $LessonRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'tasks',
              name: 'tasks',
              factory: $TasksRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $LessonsRouteExtension on LessonsRoute {
  static LessonsRoute _fromState(GoRouterState state) => LessonsRoute();

  String get location => GoRouteData.$location(
        '/lessons',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LessonRouteExtension on LessonRoute {
  static LessonRoute _fromState(GoRouterState state) => LessonRoute(
        id: state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/lessons/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TasksRouteExtension on TasksRoute {
  static TasksRoute _fromState(GoRouterState state) => TasksRoute(
        id: state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/lessons/${Uri.encodeComponent(id)}/tasks',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
