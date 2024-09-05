// import 'package:aprende_mas/views/teacher/teacher.dart';
import 'package:aprende_mas/views/login_users_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const LoginUsersScreen(),
  ),
]);
