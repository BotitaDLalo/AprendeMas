import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/groups/groups_created.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/providers/groups/groups_state.dart';
import 'package:aprende_mas/repositories/Interface_repos/groups/groups_repository.dart';

class GroupsNotifier extends StateNotifier<GroupsState> {
  final GroupsRepository groupsRepository;

  GroupsNotifier({required this.groupsRepository}) : super(GroupsState());

  Future<void> getGroups() async {
    try {
      final groups = await groupsRepository.getGroups();
      _setGroups(groups);
    } catch (e) {
      throw Exception(e);
    }
  }

  _setGroups(List<Group> groups) {
    state = state.copyWith(groups: groups);
  }

  Future<void> getCreatedGroups() async {
    try {
      final createdGroups = await groupsRepository.getCreatedGroups();
      _setCreatedGroups(createdGroups);
    } catch (e) {
      throw Exception(e);
    }
  }

  _setCreatedGroups(List<GroupsCreated> groupsCreated) {
    state = state.copyWith(groupsCreated: groupsCreated);
  }

  Future<void> createGroupSubjects(String groupName, String description,
      Color colorCode, List<SubjectsRow> subjectsList) async {
    try {
      final group = await groupsRepository.createGroupSubjects(
          groupName, description, colorCode, subjectsList);
      _setCreateGroupSubjects(group);
    } catch (e) {
      throw Exception(e);
    }
  }

  _setCreateGroupSubjects(List<Group> groups) {
    state = state.copyWith(groups: groups);
  }

  Future<void> deleteGroup() async {}

  Future<void> updateGroup() async {}

  onNewSubject(List<Group> groups) {
    state = state.copyWith(groups: groups);
  }
}
