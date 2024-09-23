import 'package:aprende_mas/config/router/router_notifier_provider.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/auth_state.dart';
import 'package:aprende_mas/views/users/forgot_password_screen.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider((ref) {
  final routerNotifier = ref.read(routerNotifierProvider);

  return GoRouter(
    initialLocation: '/loading',
    // initialLocation: '/login-user',
    refreshListenable: routerNotifier,
    routes: [
      GoRoute(
        path: '/loading',
        builder: (context, state) => const CheckAuthStatusScreen(),
      ),
      GoRoute(
        path: '/login-user',
        builder: (context, state) => const LoginUserScreen(),
      ),
      GoRoute(
        path: '/sigin-user',
        builder: (context, state) => const SinginUserScreen(),
      ),
      GoRoute(
        path: '/teacher-home',
        builder: (context, state) => const TeacherHomeScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      )
    ],
    redirect: (context, state) async {
      final isGoingTo = state.matchedLocation;
      final authStatus = routerNotifier.authStatus;

      if (isGoingTo == '/login-user' ||
          isGoingTo == '/sigin-user' ||
          isGoingTo == '/forgot-password') {
        if (authStatus == AuthStatus.authenticated) {
          await Future.delayed(const Duration(milliseconds: 800));
          return '/teacher-home';
        }

        return null;
      }

      if (authStatus == AuthStatus.authenticated) {
        await Future.delayed(const Duration(milliseconds: 800));
        return '/teacher-home';
      }

      if (authStatus == AuthStatus.notAuthenticated) {
        await Future.delayed(const Duration(milliseconds: 800));
        return '/login-user';
      }

      // if ( authStatus == AuthStatus.notAuthenticated) {
      //   await Future.delayed(const Duration(milliseconds: 800));
      //   if (isGoingTo == '/login-user' || isGoingTo == '/sigin-user') return null;
      //   return '/login-user';
      // }

      // if (isGoingTo == '/loading' && authStatus == AuthStatus.checking) return null;

      // if (authStatus == AuthStatus.notAuthenticated) {
      //   if (isGoingTo == '/login-user' || isGoingTo == '/sigin-user') return null;

      //   return '/sigin-user';
      // }

      // if (authStatus == AuthStatus.authenticated) {
      //   if (isGoingTo == '/login-user' || isGoingTo == '/sigin-user' || isGoingTo=='/loading') return '/teacher-home';
      //   return '/login-user';
      // }

      return null;
    },
  );
});
