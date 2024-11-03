import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';

import '../../../models/groups/groups_created.dart';

abstract class GroupsRepository {
  Future<List<Group>> getGroups();

  Future<List<GroupsCreated>> getCreatedGroups();
  
  Future<List<Group>> createGroup(
      String nombreGrupo, String descripcion, Color codigoColor);

  Future<List<Group>> createGroupSubjects(String groupName, String description,
     Color colorCode, List<Subject> subjectsList);

  Future<void> deleteGroup();

  Future<void> updateGroup();
}
