import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/views/teacher/activities/activities_screen.dart';
import 'package:aprende_mas/config/router/router_notifier_provider.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/auth_provider.dart';
import 'package:aprende_mas/providers/authentication/auth_state.dart';
import 'package:aprende_mas/views/student/student_home_screen.dart';
import 'package:aprende_mas/views/teacher/groups_subjects/create_group_screen.dart';
import 'package:aprende_mas/views/teacher/groups_subjects/create_subject_screen.dart';
import 'package:aprende_mas/views/users/forgot_password_screen.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:aprende_mas/views/widgets/loading/loading_screen.dart';

final goRouterProvider = Provider((ref) {
  final routerNotifier = ref.read(routerNotifierProvider);

  return GoRouter(
    initialLocation: '/loading',
    refreshListenable: routerNotifier,
    routes: [
      GoRoute(
        path: '/loading',
        builder: (context, state) => const LoadingScreen(),
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
        builder: (context, state) {
          final subjectData = state.extra as Subject;

          return ActivitiesScreen(
            subjectId: subjectData.subjectId,
            subjectName: subjectData.nombreMateria,
            description: subjectData.descripcion ?? "",
          );
        },
      )
    ],
    redirect: (context, state) async {
      final isGoingTo = state.matchedLocation;
      final authStatus = routerNotifier.authStatus;
      final authGoogleStatus = routerNotifier.authGoogleStatus;
      final authState = ref.read(authProvider);
      final authUser = authState.authUser;
      final user = authState.user;
      final role = authUser?.rol;
      final roleGoogle = user?.rol;
      // if (isGoingTo == "/loading" &&
      //     (authStatus == AuthStatus.notAuthenticated ||
      //         authGoogleStatus == AuthGoogleStatus.notAuthenticated)) {
      //   return '/login-user';
      // }

      /*
      *1. Si es googe o normal

      *2. Si se esta autenticado o no
       */
      if (role != "") {
        switch (authStatus) {
          case AuthStatus.authenticated:
            switch (role) {
              case "Docente":
                switch (isGoingTo) {
                  case "/create-group":
                    return "/create-group";

                  case "/create-subject":
                    return "/create-subject";

                  case "/activities":
                    return "/activities";
                }
                return "/teacher-home";
              case "Alumno":
                switch (isGoingTo) {
                  //TODO: COLOCAR LAS RUTAS PARA USUARIO ALUMNO
                }
                return "/student-home";
            }
            break;

          case AuthStatus.notAuthenticated:
            switch (isGoingTo) {
              // case "/login-user":
              //   return "/login-user";

              case "/sigin-user":
                return "/sigin-user";

              case "/forgot-password":
                return "/forgot-password";
            }
            return "/login-user";
          default:
            return null;
        }
      } else if (roleGoogle != "") {
        switch (authGoogleStatus) {
          case AuthGoogleStatus.authenticated:
            switch (roleGoogle) {
              case "Docente":
                switch (isGoingTo) {
                  case "/create-group":
                    return "/create-group";

                  case "/create-subject":
                    return "/create-subject";
                }
                return "/teacher-home";
              case "Alumno":
                switch (isGoingTo) {
                  //TODO: COLOCAR LAS RUTAS PARA USUARIO ALUMNO
                }
                return "/student-home";
            }
            break;

          case AuthGoogleStatus.notAuthenticated:
            break;
          default:
        }
      }
      return null;
    },
  );
});
