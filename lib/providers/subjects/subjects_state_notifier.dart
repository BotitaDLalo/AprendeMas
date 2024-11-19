import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/providers/providers.dart';
import 'package:aprende_mas/repositories/Interface_repos/subjects/subjects_repository.dart';

class SubjectsStateNotifier extends StateNotifier<List<Subject>> {
  final SubjectsRepository subjectsRepository;
  final Ref ref;

  SubjectsStateNotifier(this.ref, {required this.subjectsRepository})
      : super([]);

  Future<void> getSubjects() async {
    try {
      final subjects = await subjectsRepository.getSubjects();
      _setSubjects(subjects);
    } catch (e) {
      throw Exception(e);
    }
  }

  _setSubjects(List<Subject> subjects) {
    state = subjects;
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

  void _setSubjectWithGroups(List<Group> groups) {
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
    state = subjects;
  }
}
