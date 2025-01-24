import 'dart:ui';
import 'package:aprende_mas/models/groups/group.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/models/subjects/subjects.dart';
import 'package:aprende_mas/repositories/Implement_repos/subjects/subjects_data_source_impl.dart';
import 'package:aprende_mas/repositories/Interface_repos/subjects/subjects_data_source.dart';
import 'package:aprende_mas/repositories/Interface_repos/subjects/subjects_repository.dart';

class SubjectsRespositoryImpl implements SubjectsRepository {
  SubjectsDataSource subjectsDataSource;

  SubjectsRespositoryImpl({SubjectsDataSource? subjectsDataSource})
      : subjectsDataSource = subjectsDataSource ?? SubjectsDataSourceImpl();

  @override
  Future<List<Group>> createSubjectWithGroup(String subjectName,
      String description, Color colorCode, List<int> groupsId) {
    return subjectsDataSource.createSubjectWithGroup(
        subjectName, description, colorCode, groupsId);
  }

  @override
  Future<List<Subject>> createSubjectWithoutGroup(
      String subjectName, String description, Color colorCode) {
    return subjectsDataSource.createSubjectWithoutGroup(
        subjectName, description, colorCode);
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
  Future<List<Subject>> getSubjects() {
    return subjectsDataSource.getSubjects();
  }

  @override
  Future<List<StudentGroupSubject>> getStudentsSubject(int groupId) {
    return subjectsDataSource.getStudentsSubject(groupId);
  }

  @override
  Future<VerifyEmail> verifyEmail(String email) {
    return subjectsDataSource.verifyEmail(email);
  }

  @override
  Future<List<StudentGroupSubject>> addStudentsSubject(
      int? groupId, int subjectId, List<String> emails) {
    return subjectsDataSource.addStudentsSubject(groupId, subjectId, emails);
  }
}
