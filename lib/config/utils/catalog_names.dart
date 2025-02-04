enum AuthStatus { checking, authenticated, notAuthenticated }

enum AuthenticatedType { auth, authGoogle, undefined }

enum AuthGoogleStatus { checking, authenticated, notAuthenticated }

enum RegisterStatus { registered, notRegistered }

enum AuthConectionType { online, offline, unverified }

class CatalogNames {
  String get getRoleTeacherName => "Docente";
  String get getRoleStudentName => "Alumno";
  String get getKeyIdName => "id";
  String get getKeyRoleName => "role";
  String get getKeyTokenName => "token";
  String get getKeyUserName => "username";
  String get getKeyAuthTypeName => "authtype";
}