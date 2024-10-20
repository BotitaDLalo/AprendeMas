
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/subjects/form_subjects_state.dart';
import 'package:aprende_mas/providers/subjects/form_subjects_state_notifier.dart';
import 'package:aprende_mas/providers/subjects/subjects_provider.dart';

final formSubjectsProvider = StateNotifierProvider<FormSubjectsStateNotifier,FormSubjectsState>((ref) {
  final createSubjectCallback = ref.watch(subjectProvider.notifier).createSubject;
  return FormSubjectsStateNotifier(createSubjectCallback: createSubjectCallback);
},);
