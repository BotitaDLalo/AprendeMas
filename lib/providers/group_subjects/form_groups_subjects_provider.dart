import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/group_subjects/form_groups_subjects_state.dart';
import 'package:aprende_mas/providers/group_subjects/form_student_join_class_state_notifier.dart';
import 'package:aprende_mas/providers/group_subjects/groups_subjects_provider.dart';

final formStudentJoinClassProvider = StateNotifierProvider.autoDispose<
    FormStudentJoinClassStateNotifier, FormGroupsSubjectsState>((ref) {
  final joinClass = ref.read(groupsSubjectsProvider.notifier).joinClass;

  return FormStudentJoinClassStateNotifier(joinClassCallback: joinClass);
});
