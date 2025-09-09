import 'package:aprende_mas/models/models.dart';

class GroupsState {
  final List<Group> lsGroups;
  final List<GroupsCreated> lsGroupsCreated;

  GroupsState({
    this.lsGroups = const [],
    this.lsGroupsCreated = const [],
  });

  GroupsState copyWith({
    List<Group>? lsGroups,
    List<GroupsCreated>? lsGroupsCreated,
  }) =>
      GroupsState(
        lsGroups: lsGroups ?? this.lsGroups,
        lsGroupsCreated: lsGroupsCreated ?? this.lsGroupsCreated,
      );
}
