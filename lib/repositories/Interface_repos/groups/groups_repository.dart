
import 'package:aprende_mas/models/groups/groups.dart';

abstract class GroupsRepository {
  Future<List<Group>> getGroups();
}