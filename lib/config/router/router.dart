import 'package:aprende_mas/config/router/router_notifier_provider.dart';
import 'router_redirections.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/providers/providers.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/student/student.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:aprende_mas/views/teacher/teacher.dart';
import 'package:aprende_mas/config/utils/catalog_names.dart';

String routeAux = "";
List<GoRoute> lsRouter = [];
final goRouterProvider = Provider((ref) {
  final routerNotifier = ref.read(routerNotifierProvider);

  return GoRouter(
    // initialLocation: '/loading',
    refreshListenable: routerNotifier,
    routes: [
      // GoRoute(
      //   path: '/loading',
      //   builder: (context, state) => const LoadingScreen(),
      // ),
      GoRoute(
        path: '/login-user',
        builder: (context, state) => const LoginUserScreen(),
      ),
      GoRoute(
        path: '/missing-data',
        builder: (context, state) => const MissingDataScreen(),
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
            accessCode: groupData.codigoAcceso,
            colorCode: groupData.codigoColor,
          );
        },
      ),
      GoRoute(
        path: '/create-subject',
        builder: (context, state) => const CreateSubjectsScreen(),
      ),
      GoRoute(
        path: '/teacher-subject-options',
        builder: (context, state) {
          final subjectData = state.extra as Subject;
          debugPrint(subjectData.groupId.toString());
          return TeacherSubjectOptionsScreen(
            groupId: subjectData.groupId,
            subjectId: subjectData.materiaId,
            subjectName: subjectData.nombreMateria,
            description: subjectData.descripcion ?? "",
            codeAccess: subjectData.codigoAcceso ?? "",
          );
        },
      ),
      GoRoute(
        path: '/activities-options',
        builder: (context, state) {
          final subjectData = state.extra as Subject;
          return ActivitiesOptionScreen(
            subjectId: subjectData.materiaId,
            subjectName: subjectData.nombreMateria,
          );
        },
      ),
      GoRoute(
        path: '/create-activities',
        builder: (context, state) {
          final subjectData = state.extra as Subject;
          debugPrint(
              'Route /create-activity: subjectId: ${subjectData.materiaId}, nombreMateria: ${subjectData.nombreMateria}');
          return CreateActivitiesScreen(
              subjectId: subjectData.materiaId,
              nombreMateria: subjectData.nombreMateria);
        },
      ),
      GoRoute(
        path: '/student-subject-options',
        builder: (context, state) {
          final subjectData = state.extra as Subject;
          return StudentSubjectOptionsScreen(
            subjectId: subjectData.materiaId,
            subjectName: subjectData.nombreMateria,
            description: subjectData.descripcion ?? "",
          );
        },
      ),
      GoRoute(
        path: '/notification-content',
        builder: (context, state) {
          final notificationData = state.extra as Notice;
          return NotificationContentScreen(
            messageId: notificationData.messageId,
            title: notificationData.title,
            body: notificationData.body,
            sentDate: notificationData.sentDate,
          );
        },
      ),
      GoRoute(
        path: '/teacher-activity-settings',
        builder: (context, state) {
          final activity = state.extra as Activity;

          return ActivitySettings(activity: activity);
        },
      ),
      GoRoute(
        path: '/student-activity-section-submissions',
        builder: (context, state) {
          final activity = state.extra as Activity;

          return ActivitySectionSubmissions(activity: activity);
        },
      )
    ],
    redirect: (context, state) {
      final isGoingTo = state.matchedLocation;
      final authStatus = routerNotifier.authStatus;
      final authGoogleStatus = routerNotifier.authGoogleStatus;
      final authState = ref.read(authProvider);
      final user = authState.user;
      final role = authState.authUser?.role;
      final roleGoogle = user?.rol;
      final authType = authState.authenticatedType;
      debugPrint(isGoingTo);

      if (authType != AuthenticatedType.undefined) {
        if (authType == AuthenticatedType.auth) {
          switch (authStatus) {
            case AuthStatus.authenticated:
              return RouterRedirections.redirectsToRoute(role, isGoingTo);
            case AuthStatus.notAuthenticated:
              return RouterRedirections.redirectNotAuthenticated(isGoingTo);

            default:
              return "/login-user";
          }
        } else if (authType == AuthenticatedType.authGoogle) {
          switch (authGoogleStatus) {
            case AuthGoogleStatus.authenticated:
              return RouterRedirections.redirectsToRoute(role, isGoingTo);
            case AuthGoogleStatus.notAuthenticated:
              return RouterRedirections.redirectNotAuthenticated(isGoingTo);

            default:
              return "/login-user";
          }
        }
      } else {
        return RouterRedirections.redirectNotAuthenticated(isGoingTo);
      }
      return null;
    },
  );
});
