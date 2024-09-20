import 'package:aprende_mas/views/views.dart';
import 'package:go_router/go_router.dart';
import 'package:aprende_mas/views/home.dart';

final appRouter = GoRouter(initialLocation: '/login-user', routes: [
  GoRoute(
    path: '/login-user',
    builder: (context, state) => const LoginUserScreen(),
  ),
  GoRoute(
    path: '/singin-user',
    builder: (context, state) => const SinginUserScreen(),
  ),
  GoRoute(path: '/home', builder: (context, state) => const Home(),)
]);
