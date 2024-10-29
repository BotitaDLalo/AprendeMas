import 'package:aprende_mas/views/teacher/activities/activities_screen.dart';
import 'package:aprende_mas/views/teacher/subject_screen.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/teacher-home', routes: [
  GoRoute(
    path: '/login-user',
    builder: (context, state) => const LoginUserScreen(),
  ), 
  GoRoute(
    path: '/singin-user',
    builder: (context, state) => const SinginUserScreen(),
    ),
  GoRoute(
    path: '/teacher-home',
    builder: (context, state) => const TeacherHomeScreen(),
    ),
  GoRoute(
    path: '/activities',
    builder: (context, state) => const ActivitiesScreen(),
    ),
    GoRoute(
      path: '/subject',
      builder: (context, state) => const SubjectScreen(), 
    ),
]);
