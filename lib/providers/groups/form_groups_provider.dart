
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/groups/form_groups_state.dart';
import 'package:aprende_mas/providers/groups/form_groups_state_notifier.dart';
import 'package:aprende_mas/providers/groups/groups_provider.dart';

final formGroupsProvider = StateNotifierProvider.autoDispose<FormGroupsStateNotifier,FormGroupsState>((ref) {
  final createGroupSubjectsCallback = ref.watch(groupsProvider.notifier).createGroupSubjects;
  final updateGroupCallback = ref.watch(groupsProvider.notifier).updateGroup;
  final verifyEmailCallback = ref.watch(groupsProvider.notifier).verifyEmail;
  final addStudentsGroupCallback = ref.watch(groupsProvider.notifier).addStudentsGroup;
  return FormGroupsStateNotifier(
    createGroupSubjectsCallback: createGroupSubjectsCallback,
    updateGroupCallback: updateGroupCallback,
    verifyEmailCallback: verifyEmailCallback,
    addStudentsGroupCallback: addStudentsGroupCallback,
  );
});