class RouterRedirections {
  static final List<String> routesTeacher = [
    "/create-group",
    "/create-subject",
    "/teacher-subject-options",
    "/create-activities",
    "/group-teacher-settings",
    "/activities-options",
    '/notification-content'
  ];

  static List<String> routesStudent = ["/"];

  static List<String> routesNotNotAuthenticated = [
    "/sigin-user",
    "/forgot-password",
    "/missing-data",
  ];

  static String redirectNotAuthenticated(String isGoingTo) =>
      routesNotNotAuthenticated.contains(isGoingTo) ? isGoingTo : "/login-user";

  static String redirectsToRoute(String? role, String isGoingTo) {
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
