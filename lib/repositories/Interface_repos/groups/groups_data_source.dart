
import 'package:aprende_mas/models/groups/groups.dart';

abstract class GroupsDataSource {
  Future<List<Group>> getGroups();
}