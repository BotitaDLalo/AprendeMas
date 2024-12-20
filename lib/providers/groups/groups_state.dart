import 'package:aprende_mas/models/models.dart';

class GroupsState {
  final List<Group> groups;
  final List<GroupsCreated> groupsCreated;
  final List<VerifyEmail> lsEmails;
  final List<StudentGroup> lsStudentsGroup;

  GroupsState(
      {this.groups = const [],
      this.groupsCreated = const [],
      this.lsEmails = const [],
      this.lsStudentsGroup = const []});

  GroupsState copyWith({
    List<Group>? groups,
    List<GroupsCreated>? groupsCreated,
    List<VerifyEmail>? lsEmails,
    List<StudentGroup>? lsStudentsGroup,
  }) =>
      GroupsState(
          lsStudentsGroup: lsStudentsGroup ?? this.lsStudentsGroup,
          groups: groups ?? this.groups,
          groupsCreated: groupsCreated ?? this.groupsCreated,
          lsEmails: lsEmails ?? this.lsEmails);
}
