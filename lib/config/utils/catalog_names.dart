enum AuthStatus { checking, authenticated, notAuthenticated }

enum AuthenticatedType { auth, authGoogle, undefined }

enum AuthGoogleStatus { checking, authenticated, notAuthenticated }

enum RegisterStatus { registered, notRegistered }

enum AuthConnectionType { online, offline, unverified }

enum ErrorHandlingStyle { snackBar, dialog, undefined }

enum AuthorizationUserStatus {
  authorized("Autorizado"),
  denied("Denegado"),
  pending("Pendiente");

  final String value;
  const AuthorizationUserStatus(this.value);
}

AuthenticatedType getAuthConnectionType(String authType) {
  final authTypeEnum = AuthenticatedType.values.firstWhere(
    (element) => element.toString() == authType,
    orElse: () => AuthenticatedType.undefined,
  );

  return authTypeEnum;
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
