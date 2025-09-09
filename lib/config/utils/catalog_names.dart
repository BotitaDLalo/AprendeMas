import 'package:aprende_mas/config/utils/packages.dart';
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

final catalogNamesProvider = Provider<CatalogNames>((ref) {
  return CatalogNames();
});
