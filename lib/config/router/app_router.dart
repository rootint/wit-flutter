import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_app/presentation/screens/create_course/create_course_screen.dart';

import '../../presentation/screens/auth/auth_screen.dart';
import '../../presentation/screens/course/course_screen.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/topic/topic_screen.dart';

part 'app_router.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<CourseRoute>(
      path: 'course',
    ),
    TypedGoRoute<CreateCourseRoute>(
      path: 'create-course',
    ),
    TypedGoRoute<TopicRoute>(
      path: 'topic',
    ),
    TypedGoRoute<AuthRoute>(
      path: 'auth',
    ),
  ],
)
@immutable
class HomeRoute extends GoRouteData {
  static const path = '/';
  const HomeRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const HomeScreen();
  }
}

@immutable
class CreateCourseRoute extends GoRouteData {
  static const path = '/';
  const CreateCourseRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const CreateCourseScreen();
  }
}

@immutable
class CourseRoute extends GoRouteData {
  const CourseRoute({required this.courseId});
  final int courseId;

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return CourseScreen(courseId: courseId);
  }
}

@immutable
class TopicRoute extends GoRouteData {
  const TopicRoute({
    required this.questionId,
    required this.topicId,
  });
  final int topicId;
  final int questionId;

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return TopicScreen(
      topicId: topicId,
      questionId: questionId,
    );
  }
}

@immutable
class AuthRoute extends GoRouteData {
  const AuthRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const AuthScreen();
  }
}
