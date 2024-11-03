import 'package:aprende_mas/models/groups/groups_created.dart';
import 'package:aprende_mas/models/models.dart';

class GroupsState {
  final List<Group> groups;
  final List<GroupsCreated> groupsCreated;

  GroupsState({this.groups = const [], this.groupsCreated = const []});

  GroupsState copyWith({
    List<Group>? groups,
    List<GroupsCreated>? groupsCreated,
  }) =>
      GroupsState(
          groups: groups ?? this.groups,
          groupsCreated: groupsCreated ?? this.groupsCreated);
}
