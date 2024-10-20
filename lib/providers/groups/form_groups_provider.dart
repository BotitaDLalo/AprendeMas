
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/groups/form_groups_state.dart';
import 'package:aprende_mas/providers/groups/form_groups_state_notifier.dart';
import 'package:aprende_mas/providers/groups/groups_provider.dart';

final formGroupsProvider = StateNotifierProvider.autoDispose<FormGroupsStateNotifier,FormGroupsState>((ref) {
  final createGroupCallback = ref.watch(groupsProvider.notifier).createGroup;

  return FormGroupsStateNotifier(
    createGroupCallback: createGroupCallback
  );
});