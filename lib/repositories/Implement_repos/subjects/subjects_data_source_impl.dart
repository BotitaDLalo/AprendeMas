import 'package:aprende_mas/config/network/dio_client.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/groups/groups.dart';
import 'package:aprende_mas/models/groups/groups_mapper.dart';
import 'package:aprende_mas/models/subjects/subjects.dart';
import 'package:aprende_mas/repositories/Interface_repos/subjects/subjects_data_source.dart';

class SubjectsDataSourceImpl implements SubjectsDataSource {
  // @override
  // Future<List<Subject>> createSubject(
  //     String subjectName, String description, String colorCode) async {
  //   const uri = "/Materia";
  //   try {
  //     final res = await dio.post(uri, data: {
  //       "NombreMateria": subjectName,
  //       "Descripcion": description,
  //       "CodigoColor": colorCode
  //     });

  //     return "";
  //   } catch (e) {
  //     print(e);
  //     throw Exception(e);
  //   }
  // }

  @override
  Future<List<Group>> createSubjectWithGroup(String subjectName,
      String description, Color colorCode, List<int> groupsId) async {
    try {
      const uri = "/Materia/MateriaGrupos";
      List<int> pruebals = [];

      pruebals.add(1);
      final res = await dio.post(uri, data: {
        "NombreMateria": subjectName,
        "Descripcion": description,
        // "CodigoColor": colorCode.toString(),
        "Grupos": pruebals
      });

      final resLista = List<Map<String, dynamic>>.from(res.data);
      final groups = GroupsMapper.groupsJsonToEntityList(resLista);
      return groups;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> createSubjectWithoutGroup(
      String subjectName, String description, Color colorCode) {
    try {
      const uri = "/Materia/MateriaSinGrupo";

      final res = dio.post(uri, data: {
        "NombreMateria": subjectName,
        "Descripcion": description,
        "CodigoColor": colorCode
      });
      return res;
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

  @override
  Future<List<Subject>> createSubject(
      String subjectName, String description, Color colorCode) {
    // TODO: implement createSubject
    throw UnimplementedError();
  }
}
