import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/subjects/form_subjects_state.dart';
import 'package:aprende_mas/providers/subjects/form_subjects_state_notifier.dart';
import 'package:aprende_mas/providers/subjects/subjects_provider.dart';

final formSubjectsProvider =
    StateNotifierProvider.autoDispose<FormSubjectsStateNotifier, FormSubjectsState>(
  (ref) {
    final createSubjectWithGroups =
        ref.read(subjectsProvider.notifier).createSubjectWithGroups;
    final createSubjectWithoutGroup =
        ref.read(subjectsProvider.notifier).createSubjectWithoutGroup;

    final verifyEmailCallback = ref.read(subjectsProvider.notifier).verifyEmail;

    final addStudentsGroupCallback =
        ref.read(subjectsProvider.notifier).addStudentsSubject;

    return FormSubjectsStateNotifier(
        createSubjectWithGroupsCallback: createSubjectWithGroups,
        createSubjectWithoutGroup: createSubjectWithoutGroup,
        addStudentsGroupCallback: addStudentsGroupCallback,
        verifyEmailCallback: verifyEmailCallback);
  },
);
