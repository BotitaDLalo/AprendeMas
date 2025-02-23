import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/providers/providers.dart';
import 'package:aprende_mas/providers/subjects/subjects_state.dart';
import 'package:aprende_mas/repositories/Interface_repos/subjects/subjects_repository.dart';

class SubjectsStateNotifier extends StateNotifier<SubjectsState> {
  final SubjectsRepository subjectsRepository;
  final Ref ref;

  SubjectsStateNotifier(this.ref, {required this.subjectsRepository})
      : super(SubjectsState());

  Future<void> getSubjects() async {
    try {
      final subjects = await subjectsRepository.getSubjectsWithoutGroup();
      debugPrint("SubjectsStateNotifier: $subjects");
      if (mounted) {
        setSubjects(subjects);
      }
    } catch (e, stacktrace) {
      debugPrint("Error en getSubjects: $e");
      debugPrint("Stacktrace: $stacktrace");
      throw Exception(e);
    }
  }

  Future<List<Subject>> getSubjectsWithoutGroup() async {
    try {
      List<Subject> lsSubjects = List.from(state.subjects);
      return lsSubjects;
    } catch (e) {
      return [];
    }
  }

  setSubjects(List<Subject> subjects) {
    state = state.copyWith(subjects: subjects);
  }

  Future<void> createSubjectWithGroups(String subjectName, String description,
      Color colorCode, List<int> groupsId) async {
    try {
      final subject = await subjectsRepository.createSubjectWithGroup(
          subjectName, description, colorCode, groupsId);
      _setSubjectWithGroups(subject);
    } catch (e) {
      throw Exception(e);
    }
  }

  _setSubjectWithGroups(List<Group> groups) {
    final groupsNotifier = ref.read(groupsProvider.notifier);
    groupsNotifier.onNewSubject(groups);
  }

  Future<void> createSubjectWithoutGroup(
      String subjectName, String description, Color colorCode) async {
    try {
      final subjects = await subjectsRepository.createSubjectWithoutGroup(
          subjectName, description, colorCode);
      _setSubjectsWithoutGroups(subjects);
    } catch (e) {
      throw Exception(e);
    }
  }

  _setSubjectsWithoutGroups(List<Subject> subjects) {
    state = state.copyWith(subjects: subjects);
  }
}
