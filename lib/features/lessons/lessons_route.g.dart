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
      factory: $LessonsRouteExtension._fromState,
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
