import 'package:aprende_mas/config/network/dio_client.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/config/services/services.dart';
import 'package:aprende_mas/repositories/Interface_repos/groups/groups_data_source.dart';

class GroupsDataSourceImpl implements GroupsDataSource {
  final storageService = KeyValueStorageServiceImpl();
  @override
  Future<List<Group>> getGroupsSubjects() async {
    const uri = "/Grupos/ObtenerGruposMaterias";
    try {
      final id = await storageService.getId();
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
      final id = await storageService.getId();
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
      final id = await storageService.getId();
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

      if (res.statusCode == 200) {
        final resLista = List<Map<String, dynamic>>.from(res.data);
        final groups = GroupsMapper.groupsJsonToEntityList(resLista);
        return groups;
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  //$CREAR GRUPO SIN MATERIAS
  @override
  Future<List<Group>> createGroup(
      String nombreGrupo, String descripcion, Color codigoColor) async {
    const uri = "/Grupos/CrearGrupo";
    final id = await storageService.getId();
    try {
      final res = await dio.post(uri, data: {
        "NombreGrupo": nombreGrupo,
        "Descripcion": descripcion,
        "CodigoColor": codigoColor.toString(),
        "DocenteId": id
      });
      if (res.statusCode == 200) {
        final groups = GroupsMapper.groupsJsonToEntityList(res.data);
        return groups;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<void> deleteGroup(int teacherId, int groupId) {
    // TODO: implement updateGroup
    throw UnimplementedError();
  }

  @override
  Future<Group> updateGroup(int groupId, String groupName,
      String descriptionGroup, Color colorGroup) async {
    try {
      const uri = "/Grupos/ActualizarGrupo";
      final String hexColor = colorGroup.value.toRadixString(16).toUpperCase();
      final id = await storageService.getId();
      final res = await dio.put(uri, data: {
        "GrupoId": groupId,
        "NombreGrupo": groupName,
        "Descripcion": descriptionGroup,
        "CodigoColor": hexColor,
        "DocenteId": id
      });

      final group = GroupMapper.groupToEntity(res.data);
      if (res.statusCode == 200) {
        return group;
      }
      return GroupMapper.empty();
    } catch (e) {
      print(e);
      return GroupMapper.empty();
    }
  }

  @override
  Future<VerifyEmail> verifyEmail(String email) async {
    try {
      const uri = "/Alumnos/VerificarAlumnoEmail";
      final res = await dio.post(uri, data: {"Email": email});

      if (res.statusCode == 200) {
        final verifyEmail = VerifyEmail.verifyEmailToEntity(res.data, true);
        return verifyEmail;
      }
      return VerifyEmail.verifyEmailToEntity({}, false);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<StudentGroup>> addStudentsGroup(
      int groupId, List<String> emails) async {
    try {
      const uri = "/Alumnos/RegistrarAlumnoGMDocente";

      final res =
          await dio.post(uri, data: {"Emails": emails, "GrupoId": groupId});

      if (res.statusCode == 200) {
        final resList = List<Map<String, dynamic>>.from(res.data);
        final lsStudents = StudentGroup.studentGroupJsonToEntity(resList);
        return lsStudents;
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<StudentGroup>> getStudentsGroup(int groupId) async {
    try {
      const uri = "/Alumnos/ObtenerListaAlumnosGrupo";
      final res = await dio.post(uri, data: {"GrupoId": groupId});

      if (res.statusCode == 200) {
        final resList = List<Map<String, dynamic>>.from(res.data);
        final lsStudents = StudentGroup.studentGroupJsonToEntity(resList);
        return lsStudents;
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}
