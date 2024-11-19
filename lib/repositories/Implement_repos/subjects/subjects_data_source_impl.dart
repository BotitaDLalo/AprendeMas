import 'package:aprende_mas/config/network/dio_client.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/repositories/Interface_repos/subjects/subjects_data_source.dart';

class SubjectsDataSourceImpl implements SubjectsDataSource {
  @override
  Future<List<Subject>> getSubjects() async {
    try {
      const uri = "/Materias/ObtenerMaterias";

      final res = await dio.get(uri);

      final resList = List<Map<String, dynamic>>.from(res.data);
      final lsSubjects = SubjectsMapper.subjectsJsonToEntityList(resList);
      return lsSubjects;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Group>> createSubjectWithGroup(String subjectName,
      String description, Color colorCode, List<int> groupsId) async {
    try {
      const uri = "/Materias/MateriaGrupos";
      final res = await dio.post(uri, data: {
        "NombreMateria": subjectName,
        "Descripcion": description,
        // "CodigoColor": colorCode.toString(),
        "Grupos": groupsId
      });

      final resList = List<Map<String, dynamic>>.from(res.data);
      final groups = GroupsMapper.groupsJsonToEntityList(resList);
      return groups;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Subject>> createSubjectWithoutGroup(
      String subjectName, String description, Color colorCode) async {
    try {
      const uri = "/Materias/MateriaSinGrupo";

      final res = await dio.post(uri, data: {
        "NombreMateria": subjectName,
        "Descripcion": description,
        // "CodigoColor": colorCode
      });
      final resList = List<Map<String, dynamic>>.from(res.data);
      final lsSubjects = SubjectsMapper.subjectsJsonToEntityList(resList);
      return lsSubjects;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteSubject() {
    // TODO: implement deleteSubject
    throw UnimplementedError();
  }

  @override
  Future<void> updateSubject() {
    // TODO: implement updateSubject
    throw UnimplementedError();
  }
}
