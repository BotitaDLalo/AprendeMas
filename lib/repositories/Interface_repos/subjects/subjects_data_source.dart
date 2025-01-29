import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';

abstract class SubjectsDataSource {
  Future<List<Subject>> getSubjects();

  Future<List<Group>> createSubjectWithGroup(String subjectName,
      String description, Color colorCode, List<int> groupsId);

  Future<List<Subject>> createSubjectWithoutGroup(
      String subjectName, String description, Color colorCode);

  Future<void> deleteSubject();

  Future<void> updateSubject();

  Future<VerifyEmail> verifyEmail(String email);

  Future<List<StudentGroupSubject>> addStudentsSubject(
      int? groupId, int subjectId, List<String> emails);

  Future<List<StudentGroupSubject>> getStudentsSubject(int subjectId);
}