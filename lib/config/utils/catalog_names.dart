enum AuthStatus { checking, authenticated, notAuthenticated }

enum AuthenticatedType { auth, authGoogle, undefined }

enum AuthGoogleStatus { checking, authenticated, notAuthenticated }

enum RegisterStatus { registered, notRegistered }

enum AuthConectionType { online, offline, unverified }

enum ErrorHandlingStyle { snackBar, dialog , undefined}

enum TeachersAuthorizationStatus {
  authorized("Autorizado"),
  denied("Denegado"),
  pending("Pendiente");

  final String value;
  const TeachersAuthorizationStatus(this.value);
}

class CatalogNames {
  String get getRoleTeacherName => "Docente";
  String get getRoleStudentName => "Alumno";
  String get getKeyIdName => "id";
  String get getKeyRoleName => "role";
  String get getKeyTokenName => "token";
  String get getKeyUserName => "username";
  String get getKeyAuthTypeName => "authtype";
  String get getKeyEmailName => "email";
}
