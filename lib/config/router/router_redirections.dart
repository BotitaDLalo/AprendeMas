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
  '/teacher-create-notice'
];

  static List<String> routesStudent = [
    "/student-subject-options",
    "/student-activity-section-submissions"
  ];

  static List<String> routesNotAuthenticated = [
    "/sigin-user",
    "/forgot-password",
    "/missing-data",
  ];

  static String redirectNotAuthenticated(String isGoingTo) =>
      routesNotAuthenticated.contains(isGoingTo) ? isGoingTo : "/login-user";

  static String redirectsToRoute(String? role, String isGoingTo) {
    debugPrint('Evaluando redirección: Rol: $role, Ruta solicitada: $isGoingTo');
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
