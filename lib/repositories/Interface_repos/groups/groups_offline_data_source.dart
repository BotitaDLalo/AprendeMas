import 'package:aprende_mas/models/models.dart';

abstract class GroupsOfflineDataSource {
  Future<List<Group>> getGroupsSubjects();

  Future<void> saveGroupSubjects(List<Group> lsGroups);
}