import 'package:aprende_mas/models/groups/groups_created.dart';

class GroupsCreatedMapper {
  static List<GroupsCreated> groupsCreatedToEntityList(
      List<Map<String, dynamic>> groupsCreated) {
    List<GroupsCreated> lsGroups = groupsCreated.map((e) {
      return GroupsCreated(groupId: e['grupoId'], groupName: e['nombreGrupo']);
    }).toList();
    return lsGroups;
  }
}
