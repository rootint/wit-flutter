// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'course',
          factory: $CourseRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'create-course',
          factory: $CreateCourseRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'topic',
          factory: $TopicRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'summary',
          factory: $SummaryRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'auth',
          factory: $AuthRouteExtension._fromState,
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CourseRouteExtension on CourseRoute {
  static CourseRoute _fromState(GoRouterState state) => CourseRoute(
        courseId: int.parse(state.queryParameters['course-id']!),
      );

  String get location => GoRouteData.$location(
        '/course',
        queryParams: {
          'course-id': courseId.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CreateCourseRouteExtension on CreateCourseRoute {
  static CreateCourseRoute _fromState(GoRouterState state) =>
      const CreateCourseRoute();

  String get location => GoRouteData.$location(
        '/create-course',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TopicRouteExtension on TopicRoute {
  static TopicRoute _fromState(GoRouterState state) => TopicRoute(
        questionId: int.parse(state.queryParameters['question-id']!),
        topicId: int.parse(state.queryParameters['topic-id']!),
      );

  String get location => GoRouteData.$location(
        '/topic',
        queryParams: {
          'question-id': questionId.toString(),
          'topic-id': topicId.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SummaryRouteExtension on SummaryRoute {
  static SummaryRoute _fromState(GoRouterState state) => SummaryRoute(
        topicId: int.parse(state.queryParameters['topic-id']!),
      );

  String get location => GoRouteData.$location(
        '/summary',
        queryParams: {
          'topic-id': topicId.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AuthRouteExtension on AuthRoute {
  static AuthRoute _fromState(GoRouterState state) => const AuthRoute();

  String get location => GoRouteData.$location(
        '/auth',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
