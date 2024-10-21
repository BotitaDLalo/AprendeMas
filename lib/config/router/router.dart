import 'package:aprende_mas/views/teacher/activities/activities_screen.dart';
import 'package:aprende_mas/config/router/router_notifier_provider.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/auth_provider.dart';
import 'package:aprende_mas/providers/authentication/auth_state.dart';
import 'package:aprende_mas/views/student/student_home_screen.dart';
import 'package:aprende_mas/views/teacher/create_group_screen.dart';
import 'package:aprende_mas/views/teacher/create_subject_screen.dart';
import 'package:aprende_mas/views/users/forgot_password_screen.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:aprende_mas/views/widgets/loading/check_auth_status_screen.dart';
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
  )
]);
final goRouterProvider = Provider((ref) {
  final routerNotifier = ref.read(routerNotifierProvider);

  return GoRouter(
    initialLocation: '/loading',
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
        path: '/student-home',
        builder: (context, state) => const StudentHomeScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: '/create-group',
        builder: (context, state) => const CreateGroupScreen(),
      ),
      GoRoute(
        path: '/create-subject',
        builder: (context, state) => const CreateSubjectsScreen(),
      ),
      GoRoute(
        path: '/activities',
        builder: (context, state) => const ActivitiesScreen(),
      )
    ],
    redirect: (context, state) async {
      final isGoingTo = state.matchedLocation;
      final authStatus = routerNotifier.authStatus;
      final authGoogleStatus = routerNotifier.authGoogleStatus;

      final authState = ref.read(authProvider);
      final authUser = authState.authUser;
      final user = authState.user;
      // final role = "Docente";
      final role = authUser?.rol;
      final roleGoogle = user?.rol;
      print(isGoingTo);
      // if (isGoingTo == "/loading" &&
      //     (authStatus == AuthStatus.notAuthenticated ||
      //         authGoogleStatus == AuthGoogleStatus.notAuthenticated)) {
      //   return '/login-user';
      // }
      if (isGoingTo == '/create-group' ||
          isGoingTo == '/create-subject' ||
          isGoingTo == "/teacher-home" ||
          isGoingTo == "/activities") {
        return null;
      }

      if (isGoingTo == '/login-user' ||
          isGoingTo == '/sigin-user' ||
          isGoingTo == '/forgot-password') {
        if (authStatus == AuthStatus.authenticated ||
            authGoogleStatus == AuthGoogleStatus.authenticated) {
          await Future.delayed(const Duration(milliseconds: 8000));
          if (role == "Docente" || roleGoogle == "Docente") {
            return '/teacher-home';
          } else if (role == "Alumno" || roleGoogle == "Alumno") {
            // await Future.delayed(const Duration(milliseconds: 8000));
            return '/student-home';
          }
        }
        return null;
      }

      if (authStatus == AuthStatus.authenticated ||
          authGoogleStatus == AuthGoogleStatus.authenticated) {
        await Future.delayed(const Duration(milliseconds: 800));
        if (role == "Docente" || roleGoogle == "Docente") {
          return '/teacher-home';
        } else if (role == "Alumno" || roleGoogle == "Alumno") {
          // await Future.delayed(const Duration(milliseconds: 8000));
          return '/student-home';
        }
      }

      if (authStatus == AuthStatus.notAuthenticated ||
          authGoogleStatus == AuthGoogleStatus.notAuthenticated) {
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
