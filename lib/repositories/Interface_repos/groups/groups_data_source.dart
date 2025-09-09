import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';

abstract class GroupsDataSource {
  Future<List<Group>> getGroupsSubjects();

  Future<List<GroupsCreated>> getCreatedGroups();

  Future<List<Group>> createGroup(
      String nombreGrupo, String descripcion);

  Future<List<Group>> createGroupSubjects(String groupName, String description,
       List<SubjectsRow> subjectsList);

  Future<void> deleteGroup(int teacherId, int groupId);

  Future<Group> updateGroup(
      int groupId, String groupName, String descriptionGroup);
  
  Future<VerifyEmail> verifyEmail(String email);

  Future<List<StudentGroupSubject>> addStudentsGroup(int groupId, List<String> emails);

  Future<List<StudentGroupSubject>> getStudentsGroup(int groupId);
}
