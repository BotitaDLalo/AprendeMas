import 'package:aprende_mas/config/utils/packages.dart';

class RouterRedirections {
  static final List<String> routesTeacher = [
    "/create-group",
    "/create-subject",
    "/teacher-subject-options",
    "/create-activities",
    "/create-event",
    "/update-event", // Asegúrate de que esté aquí
    "/create-event",
    "/event-detail",
    "/group-teacher-settings",
    "/activities-options",
    "/notification-content",
    "/teacher-activity-settings",
    "/teacher-activities-students-options",
    '/teacher-activity-student-submission',
    '/teacher-student-submission-grading',
    '/teacher-create-notice',
    '/agenda-teacher',
  ];

  static List<String> routesStudent = [
    "/student-subject-options",
    "/student-activity-section-submissions",
    '/notification-content',
    '/event-detail-student',
    '/student-join-group-subject'
  ];

  static List<String> routesNotAuthenticated = [
    '/signin-user',
    "/forgot-password",
    "/missing-data",
    '/confirmation-code-screen',
    '/verify-email-signin-screen'
  ];

  static String redirectNotAuthenticated(String isGoingTo) =>
      routesNotAuthenticated.contains(isGoingTo) ? isGoingTo : "/login-user";

  static String redirectsToRoute(String? role, String isGoingTo) {
    debugPrint(
        'Evaluando redirección: Rol: $role, Ruta solicitada: $isGoingTo');
    try {
      switch (role) {
        case "Docente":
          return routesTeacher.contains(isGoingTo)
              ? isGoingTo
              : "/teacher-home";

        case "Alumno":
          return routesStudent.contains(isGoingTo)
              ? isGoingTo
              : "/student-home";
      }
    } catch (e) {
      switch (role) {
        case "Docente":
          return "/teacher-home";

        case "Alumno":
          return "/student-home";
      }
    }
    return "";
  }
}
