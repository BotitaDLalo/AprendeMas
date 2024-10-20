import 'dart:ui';

import 'package:aprende_mas/models/subjects/subjects.dart';

abstract class SubjectsRepository {
  Future<List<Subject>> createSubject(
      String subjectName, String description, Color colorCode);

  Future<void> createSubjectWithoutGroup(
      String subjectName, String description, Color colorCode);

  Future<void> deleteSubject();

  Future<void> updateSubject();
}
