import 'package:aprende_mas/models/models.dart';

class SubjectsMapper {
  static List<Subject> subjectsJsonToEntityList(
      List<Map<String, dynamic>> subjectsJson) {
    List<Subject> lsSubjects = subjectsJson.map((e) {
      return Subject(materiaId: e['materiaId'],nombreMateria: e['nombreMateria'], descripcion: e['descripcion'], codigoAcceso: e['codeAcess']);
    }).toList();
    return lsSubjects;
  }
}
