import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/repositories/Interface_repos/subjects/subjects_repository.dart';

class SubjectsStateNotifier extends StateNotifier<List<Subject>> {
  final SubjectsRepository subjectsRepository;

  SubjectsStateNotifier({required this.subjectsRepository}) : super([]) {
    getSubjects();
  }

  Future<void> createSubject(
      String subjectName, String description, Color colorCode) async {
    try {
      final subject = await subjectsRepository.createSubject(subjectName,description,colorCode);
      _setCreateSubject(subject);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> getSubjects() async {}

  void _setCreateSubject(List<Subject> subjects) {
    state = subjects;
  }
}
