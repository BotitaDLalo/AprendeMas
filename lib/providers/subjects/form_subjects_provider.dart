import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/subjects/form_subjects_state.dart';
import 'package:aprende_mas/providers/subjects/form_subjects_state_notifier.dart';
import 'package:aprende_mas/providers/subjects/subjects_provider.dart';

final formSubjectsProvider =
    StateNotifierProvider<FormSubjectsStateNotifier, FormSubjectsState>(
  (ref) {
    final createSubjectWithGroups =
        ref.watch(subjectsProvider.notifier).createSubjectWithGroups;
    final createSubjectWithoutGroup =
        ref.watch(subjectsProvider.notifier).createSubjectWithoutGroup;

    return FormSubjectsStateNotifier(
        createSubjectWithGroupsCallback: createSubjectWithGroups,
        createSubjectWithoutGroup: createSubjectWithoutGroup);
  },
);
