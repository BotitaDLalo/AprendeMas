import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/groups/form_groups_state.dart';
import 'package:aprende_mas/providers/groups/form_groups_state_notifier.dart';
import 'package:aprende_mas/providers/groups/form_students_group_state_notifier.dart';
import 'package:aprende_mas/providers/groups/groups_provider.dart';
import 'package:aprende_mas/providers/groups/students_group_provider.dart';

final formGroupsProvider =
    StateNotifierProvider<FormGroupsStateNotifier, FormGroupsState>((ref) {
  final createGroupSubjectsCallback =
      ref.read(groupsProvider.notifier).createGroupSubjects;
  final updateGroupCallback = ref.read(groupsProvider.notifier).updateGroup;

  return FormGroupsStateNotifier(
    createGroupSubjectsCallback: createGroupSubjectsCallback,
    updateGroupCallback: updateGroupCallback,
  );
});

final formStudentsGroupProvider = StateNotifierProvider.autoDispose<
    FormStudentsGroupStateNotifier, FormGroupsState>(
  (ref) {
    final verifyEmailCallback =
        ref.read(studentsGroupProvider.notifier).verifyEmail;

    final addStudentsGroupCallback =
        ref.read(studentsGroupProvider.notifier).addStudentsGroup;
    return FormStudentsGroupStateNotifier(
      verifyEmailCallback: verifyEmailCallback,
      addStudentsGroupCallback: addStudentsGroupCallback,
    );
  },
);
