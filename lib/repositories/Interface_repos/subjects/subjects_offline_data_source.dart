import 'package:aprende_mas/models/models.dart';

abstract class SubjectsOfflineDataSource {
  Future<List<Subject>> getSujectsWithoutGroup();

  Future<void> saveSubjectsWithoutGroup(List<Subject> lsSubjectsWithoutGroup);
}
