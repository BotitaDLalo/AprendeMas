import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/providers/providers.dart';
import 'package:aprende_mas/config/router/router_notifier_provider.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:aprende_mas/views/teacher/teacher.dart';

String routeAux = "";
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
        path: '/group-teacher-settings',
        builder: (context, state) {
          final groupData = state.extra as Group;
          return GroupTeacherOptions(
            id: groupData.grupoId ?? -1,
            groupName: groupData.nombreGrupo,
            description: groupData.descripcion ?? "",
            accessCode: groupData.codigoAcceso ?? "",
            colorCode: groupData.codigoColor,
          );
        },
      ),
      GoRoute(
        path: '/create-subject',
        builder: (context, state) => const CreateSubjectsScreen(),
      ),
      GoRoute(
        path: '/activities',
        builder: (context, state) {
          final subjectData = state.extra as Subject;
          return ActivitiesTeacherScreen(
            subjectId: subjectData.subjectId,
            subjectName: subjectData.nombreMateria,
            description: subjectData.descripcion ?? "",
            codeAccess: subjectData.codeAccess ?? "",
          );
        },
      ),
      GoRoute(
        path: '/activities-options',
        builder: (context, state)  {
          final subjectData = state.extra as Subject;
          return ActivitiesOptionScreen(
            subjectId: subjectData.subjectId,
            nombreMateria: subjectData.nombreMateria,);
        },
      ),
      GoRoute(
        path: '/create-activities',
        builder: (context, state) {
          final subjectData = state.extra as Subject;
           debugPrint('Route /create-activity: subjectId: ${subjectData.subjectId}, nombreMateria: ${subjectData.nombreMateria}');
          return CreateActivitiesScreen(
            subjectId: subjectData.subjectId,
            nombreMateria: subjectData.nombreMateria
          );
        },
      ), 
    ],
    redirect: (context, state) {
      final isGoingTo = state.matchedLocation;
      final authStatus = routerNotifier.authStatus;
      final authGoogleStatus = routerNotifier.authGoogleStatus;
      final authState = ref.read(authProvider);
      final authUser = authState.authUser;
      final user = authState.user;
      final role = authUser?.rol;
      final roleGoogle = user?.rol;
      print(isGoingTo);

      if (isGoingTo == routeAux) {
        routeAux = "";
        return null;
      }
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

                  case "/create-activities":
                    return "/create-activities";

                  case "/group-teacher-settings":
                    return "/group-teacher-settings";

                  case "/activities-options":
                    return "/activities-options";
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
