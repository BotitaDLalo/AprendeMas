import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/providers/groups/groups_state.dart';
import 'package:aprende_mas/repositories/Implement_repos/activity/activity_offline_repository_impl.dart';
import 'package:aprende_mas/repositories/Interface_repos/groups/groups_repository.dart';
import 'package:aprende_mas/repositories/Interface_repos/groups/groups_offline_repository.dart';

class GroupsNotifier extends StateNotifier<GroupsState> {
  final Function(int) getAllActivitiesCallback;
  final Function(int) getSubmissionsCallback;
  final GroupsRepository groupsRepository;
  final ActivityOfflineRepositoryImpl activityOffline;
  final GroupsOfflineRepository groupsOfflineRepository;

  GroupsNotifier(
      {required this.getAllActivitiesCallback,
      required this.getSubmissionsCallback,
      required this.groupsRepository,
      required this.activityOffline,
      required this.groupsOfflineRepository})
      : super(GroupsState());

  Future<void> getGroupsSubjects() async {
    try {
      final groups = await groupsRepository.getGroupsSubjects();
      setGroupsSubjects(groups);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getGroupsSubjectsOffile() async {
    try {
      final groups = await groupsOfflineRepository.getGroupsSubjects();
      setGroupsSubjects(groups);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void setGroupsSubjects(List<Group> lsGroups) {
    state = state.copyWith(lsGroups: lsGroups);
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
    state = state.copyWith(lsGroupsCreated: groupsCreated);
  }

  Future<bool> createGroupSubjects(
      String groupName,
      String description,
      // Color colorCode,
      List<SubjectsRow> subjectsList) async {
    try {
      final group = await groupsRepository.createGroupSubjects(
          groupName, description, subjectsList);

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
    state = state.copyWith(lsGroups: groups);
  }

  Future<void> deleteGroup() async {}

  Future<bool> updateGroup(
      int groupId, String groupName, String descriptionGroup) async {
    try {
      Group updateGroup = await groupsRepository.updateGroup(
          groupId, groupName, descriptionGroup);

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
    List<Group> lsGroups = List.from(state.lsGroups);
    final index =
        lsGroups.indexWhere((group) => group.grupoId == updateGroup.grupoId);
    final newGroupName = updateGroup.nombreGrupo;
    final newDescriptionGroup = updateGroup.descripcion;

    if (index != -1) {
      lsGroups[index] = lsGroups[index].copyWith(
          nombreGrupo: newGroupName, descripcion: newDescriptionGroup);

      state = state.copyWith(lsGroups: lsGroups);
    }
  }

  onNewSubject(List<Group> groups) {
    state = state.copyWith(lsGroups: groups);
  }

  void addGroupToState(Group group) async {
    state = state.copyWith(lsGroups: [group, ...state.lsGroups]);

    List<Group> lsGroup = [group];

    await groupsOfflineRepository.saveGroupSubjects(lsGroup);

    final lsSubjects = group.materias;

    for (var subj in lsSubjects ?? []) {
      final subject = subj as Subject;
      final subjectId = subject.materiaId;

      //& Actualizamos el state de actividades
      await getAllActivitiesCallback(subjectId);
      for (var act in subj.actividades ?? []) {
        final activity = act as Activity;
        final activityId = activity.activityId;
        //TODO: METODO PARA GUARDAR ENTREGABLES OFFLINE (tbAlumnoActividades, tbEntregable)

        //& Guardar entregables offline set para submissions state
        List<Submission> lsSubmissions =
            await getSubmissionsCallback(activityId!);
        await activityOffline.saveSubmissions(lsSubmissions, activityId);
      }
    }
  }

  void clearGroupsState() {
    state = GroupsState();
  }
}
