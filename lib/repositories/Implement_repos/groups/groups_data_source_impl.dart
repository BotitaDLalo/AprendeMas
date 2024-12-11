import 'package:aprende_mas/config/network/dio_client.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/config/services/services.dart';
import 'package:aprende_mas/repositories/Interface_repos/groups/groups_data_source.dart';

class GroupsDataSourceImpl implements GroupsDataSource {
  @override
  Future<List<Group>> getGroupsSubjects() async {
    const uri = "/Grupos/ObtenerGruposMaterias";
    try {
      final storageService = KeyValueStorageServiceImpl();
      final id = await storageService.getValueToken<int>('id');
      final res = await dio.get(uri, queryParameters: {'docenteid': id});
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
      const uri = "/Grupos/ObtenerGruposCreados";
      final storageService = KeyValueStorageServiceImpl();
      final id = await storageService.getValueToken<int>('id');
      final res = await dio.get(uri, queryParameters: {'docenteid': id});
      final resList = List<Map<String, dynamic>>.from(res.data);
      final lsGroups = GroupsCreatedMapper.groupsCreatedToEntityList(resList);
      return lsGroups;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Group>> createGroupSubjects(String groupName, String description,
      Color colorCode, List<SubjectsRow> subjectsList) async {
    try {
      const uri = "/Grupos/CrearGrupoMaterias";
      final storageService = KeyValueStorageServiceImpl();
      final id = await storageService.getValueToken<int>('id');
      final String hexColor = colorCode.value.toRadixString(16).toUpperCase();
      final subList = subjectsList
          .map((subject) => subject.toJsonGroupsSubjects())
          .toList();

      final res = await dio.post(uri, data: {
        "DocenteId": id,
        "NombreGrupo": groupName,
        "Descripcion": description,
        "CodigoColor": hexColor,
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
    const uri = "/Grupos/CrearGrupo";
    final storageService = KeyValueStorageServiceImpl();
    final id = await storageService.getValueToken<int>('id');
    try {
      final res = await dio.post(uri, data: {
        "NombreGrupo": nombreGrupo,
        "Descripcion": descripcion,
        "CodigoColor": codigoColor.toString(),
        "DocenteId": id
      });
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
