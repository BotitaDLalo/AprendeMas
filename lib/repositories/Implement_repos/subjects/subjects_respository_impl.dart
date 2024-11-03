import 'dart:ui';

import 'package:aprende_mas/models/groups/groups.dart';
import 'package:aprende_mas/models/groups/groups_created.dart';
import 'package:aprende_mas/models/subjects/subjects.dart';
import 'package:aprende_mas/repositories/Implement_repos/subjects/subjects_data_source_impl.dart';
import 'package:aprende_mas/repositories/Interface_repos/subjects/subjects_data_source.dart';
import 'package:aprende_mas/repositories/Interface_repos/subjects/subjects_repository.dart';

class SubjectsRespositoryImpl implements SubjectsRepository {
  SubjectsDataSource subjectsDataSource;

  SubjectsRespositoryImpl({SubjectsDataSource? subjectsDataSource})
      : subjectsDataSource = subjectsDataSource ?? SubjectsDataSourceImpl();

  @override
  Future<List<Subject>> createSubject(
      String subjectName, String description, Color colorCode) {
    return subjectsDataSource.createSubject(
        subjectName, description, colorCode);
  }

  @override
  Future<void> createSubjectWithoutGroup(
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
  Future<List<Group>> createSubjectWithGroup(String subjectName,
      String description, Color colorCode, List<int> groupsId) {
    return subjectsDataSource.createSubjectWithGroup(
        subjectName, description, colorCode, groupsId);
  }

}
