import 'package:aprende_mas/config/network/dio_client.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/groups/groups.dart';
import 'package:aprende_mas/models/groups/groups_created.dart';
import 'package:aprende_mas/models/groups/groups_created_mapper.dart';
import 'package:aprende_mas/models/groups/groups_mapper.dart';
import 'package:aprende_mas/models/subjects/subjects.dart';
import 'package:aprende_mas/repositories/Interface_repos/groups/groups_data_source.dart';

class GroupsDataSourceImpl implements GroupsDataSource {
  @override
  Future<List<Group>> getGroups() async {
    const uri = "/Grupo/ObtenerGruposMaterias";
    try {
      final res = await dio.get(uri);
      final resList = List<Map<String, dynamic>>.from(res.data);
      final groups = GroupsMapper.groupsJsonToEntityList(resList);
      return groups;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<GroupsCreated>> getCreatedGroups() async {
    try {
      const uri = "/Grupo/ObtenerGruposCreados";
      final res = await dio.get(uri);
      final resList = List<Map<String, dynamic>>.from(res.data);
      final lsGroups = GroupsCreatedMapper.groupsCreatedToEntityList(resList);
      return lsGroups;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Group>> createGroupSubjects(String groupName, String description,
      Color colorCode, List<Subject> subjectsList) async {
    try {
      const uri = "/Grupo/CrearGrupoMaterias";
      final subList = subjectsList
          .map((subject) => subject.toJsonGroupsSubjects())
          .toList();
      final res = await dio.post(uri, data: {
        "NombreGrupo": groupName,
        "Descripcion": description,
        "CodigoColor": colorCode.toString(),
        "Materias": subList
      });

      final resLista = List<Map<String, dynamic>>.from(res.data);
      final groups = GroupsMapper.groupsJsonToEntityList(resLista);
      return groups;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  @override
  Future<List<Group>> createGroup(
      String nombreGrupo, String descripcion, Color codigoColor) async {
    const uri = "/Grupo/CrearGrupo";
    try {
      final res = await dio.post(uri, data: {
        "nombreGrupo": nombreGrupo,
        "descripcion": descripcion,
        "codigoColor": codigoColor.toString()
      });
      // final resLista = List<Map<String, dynamic>>.from(res.data);
      final groups = GroupsMapper.groupsJsonToEntityList(res.data);
      return groups;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteGroup() {
    // TODO: implement deleteGroup
    throw UnimplementedError();
  }

  @override
  Future<void> updateGroup() {
    // TODO: implement updateGroup
    throw UnimplementedError();
  }
}
