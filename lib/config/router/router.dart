// import 'package:aprende_mas/views/teacher/teacher.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/login-user-screen', routes: [
  GoRoute(
    path: '/login-user-screen',
    builder: (context, state) => const LoginUserScreen(),
  )
]);
