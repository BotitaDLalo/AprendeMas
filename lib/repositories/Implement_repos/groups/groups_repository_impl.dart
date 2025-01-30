import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/repositories/Implement_repos/groups/groups_data_source_impl.dart';
import 'package:aprende_mas/repositories/Interface_repos/groups/groups_data_source.dart';
import 'package:aprende_mas/repositories/Interface_repos/groups/groups_repository.dart';

class GroupsRepositoryImpl implements GroupsRepository {
  final GroupsDataSource groupsDataSource;

  GroupsRepositoryImpl({GroupsDataSource? groupsDataSource})
      : groupsDataSource = groupsDataSource ?? GroupsDataSourceImpl();

  @override
  Future<List<Group>> getGroupsSubjects() {
    return groupsDataSource.getGroupsSubjects();
  }

  @override
  Future<List<Group>> createGroup(
      String nombreGrupo, String descripcion, Color codigoColor) {
    return groupsDataSource.createGroup(nombreGrupo, descripcion, codigoColor);
  }

  @override
  Future<List<Group>> createGroupSubjects(String groupName, String description,
      Color colorCode, List<SubjectsRow> subjectsList) {
    return groupsDataSource.createGroupSubjects(
        groupName, description, colorCode, subjectsList);
  }

  @override
  Future<List<GroupsCreated>> getCreatedGroups() {
    return groupsDataSource.getCreatedGroups();
  }

  @override
  Future<void> deleteGroup(int teacherId, int groupId) {
    return groupsDataSource.deleteGroup(teacherId, groupId);
  }

  @override
  Future<Group> updateGroup(
      int groupId, String groupName, String descriptionGroup, Color colorGroup) {
    return groupsDataSource.updateGroup(
        groupId, groupName, descriptionGroup, colorGroup);
  }
  
  @override
  Future<VerifyEmail> verifyEmail(String email) {
    return groupsDataSource.verifyEmail(email);
  }
  
  @override
  Future<List<StudentGroupSubject>> addStudentsGroup(int subjectId, List<String> emails) {
    return groupsDataSource.addStudentsGroup(subjectId, emails);
  }
  
  @override
  Future<List<StudentGroupSubject>> getStudentsGroup(int subjectId) {
    return groupsDataSource.getStudentsGroup(subjectId);
  }
}