import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/providers/groups/groups_state.dart';
import 'package:aprende_mas/repositories/Interface_repos/groups/groups_repository.dart';

class GroupsNotifier extends StateNotifier<GroupsState> {
  final GroupsRepository groupsRepository;

  GroupsNotifier({required this.groupsRepository}) : super(GroupsState());

  Future<void> getGroupsSubjects() async {
    try {
      final groups = await groupsRepository.getGroupsSubjects();
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

  Future<bool> createGroupSubjects(String groupName, String description,
      Color colorCode, List<SubjectsRow> subjectsList) async {
    try {
      final group = await groupsRepository.createGroupSubjects(
          groupName, description, colorCode, subjectsList);

      if (group.isNotEmpty) {
        _setCreateGroupSubjects(group);
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e);
    }
  }

  _setCreateGroupSubjects(List<Group> groups) {
    state = state.copyWith(groups: groups);
  }

  Future<void> deleteGroup() async {}

  Future<bool> updateGroup(int groupId, String groupName,
      String descriptionGroup, Color colorGroup) async {
    try {
      Group updateGroup = await groupsRepository.updateGroup(
          groupId, groupName, descriptionGroup, colorGroup);

      if (updateGroup.grupoId != -1) {
        _setUpdateGroup(updateGroup);
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e);
    }
  }

  _setUpdateGroup(Group updateGroup) {
    List<Group> lsGroups = List.from(state.groups);
    final index =
        lsGroups.indexWhere((group) => group.grupoId == updateGroup.grupoId);
    final groupId = updateGroup.grupoId;
    final newGroupName = updateGroup.nombreGrupo;
    final newDescriptionGroup = updateGroup.descripcion;
    final newColorGroup = updateGroup.codigoColor;

    if (index != -1) {
      lsGroups[index] = Group(
          grupoId: groupId,
          nombreGrupo: newGroupName,
          descripcion: newDescriptionGroup,
          codigoColor: newColorGroup);

      state = state.copyWith(groups: lsGroups);
    }
  }

  onNewSubject(List<Group> groups) {
    state = state.copyWith(groups: groups);
  }
}
