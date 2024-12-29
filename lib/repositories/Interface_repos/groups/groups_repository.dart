import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';

abstract class GroupsRepository {
  Future<List<Group>> getGroupsSubjects();

  Future<List<GroupsCreated>> getCreatedGroups();

  Future<List<Group>> createGroup(
      String nombreGrupo, String descripcion, Color codigoColor);

  Future<List<Group>> createGroupSubjects(String groupName, String description,
      Color colorCode, List<SubjectsRow> subjectsList);

  Future<void> deleteGroup(int teacherId, int groupId);

  Future<Group> updateGroup(
      int groupId, String groupName, String descriptionGroup, Color colorGroup);

  Future<VerifyEmail> verifyEmail(String email);

  Future<List<StudentGroup>> addStudentsGroup(int groupId, List<String> emails);

  Future<List<StudentGroup>> getStudentsGroup(int groupId);

  
}
