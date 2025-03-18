import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/providers/group_subjects/groups_subjects_state.dart';
import 'package:aprende_mas/repositories/Interface_repos/groups_subjects/groups_subjects_repository.dart';

class GroupsSubjectsStateNotifier extends StateNotifier<GroupsSubjectsState> {
  final GroupsSubjectsRepository repository;
  final Function(Group) addGroupToState;
  final Function(Subject) addSubjectToState;
  GroupsSubjectsStateNotifier(
      {required this.repository,
      required this.addGroupToState,
      required this.addSubjectToState})
      : super(GroupsSubjectsState());

  Future<bool> joinClass(String codeClass) async {
    try {
      final res = await repository.joinClass(codeClass);

      if (res.isGroup) {
        addGroupToState(res.group!);
      } else {
        addSubjectToState(res.subject!);
      }
      return true;
    } on UncontrolledError catch (e) {
      _errorMessage(e.message);
      return false;
    }
  }

  _errorMessage(String message) {
    state = state.copyWith(errorMessage: message);
  }
}
