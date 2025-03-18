import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/group_subjects/groups_subjects_state.dart';
import 'package:aprende_mas/providers/group_subjects/groups_subjects_state_notifier.dart';
import 'package:aprende_mas/providers/providers.dart';
import 'package:aprende_mas/repositories/Implement_repos/groups_subjects/groups_subjects_repository_impl_provider.dart';

final groupsSubjectsProvider =
    StateNotifierProvider<GroupsSubjectsStateNotifier, GroupsSubjectsState>(
  (ref) {
    final groupsSubjectsRepository =
        ref.watch(groupsSubjectsRepositoryImplProvider);
    final addSubjectToStateCallback =
        ref.read(subjectsProvider.notifier).addSubjectToState;
    final addGroupToStateCallback =
        ref.read(groupsProvider.notifier).addGroupToState;

    return GroupsSubjectsStateNotifier(
        repository: groupsSubjectsRepository,
        addGroupToState: addGroupToStateCallback,
        addSubjectToState: addSubjectToStateCallback);
  },
);
