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
    final subjects = await subjectsRepository.getSubjects();
    debugPrint("SubjectsStateNotifier: $subjects");
    if (mounted) {
      _setSubjects(subjects);
    }
  } catch (e, stacktrace) {
    debugPrint("Error en getSubjects: $e");
    debugPrint("Stacktrace: $stacktrace");
    throw Exception(e);
  }
}



  _setSubjects(List<Subject> subjects) {
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

  onDeleteVeryfyEmail(int index) {
    List<VerifyEmail> lsEmails = List.from(state.lsEmails);
    lsEmails.removeAt(index);
    state = state.copyWith(lsEmails: lsEmails);
  }

  clearLsEmails() {
    state = state.copyWith(lsEmails: []);
  }

  Future<VerifyEmail> verifyEmail(String email) async {
    try {
      List<VerifyEmail> lsEmails = List.from(state.lsEmails);
      bool emailExist = lsEmails.any((element) => element.email == email);
      if (!emailExist) {
        final res = await subjectsRepository.verifyEmail(email);
        _setVerifyEmail(res);
        return res;
      }
      return VerifyEmail(email: '', isEmailValid: false);
    } catch (e) {
      return VerifyEmail(email: '', isEmailValid: false);
    }
  }

  _setVerifyEmail(VerifyEmail verifyEmail) {
    final lsEmails = List.from(state.lsEmails);
    state = state.copyWith(lsEmails: [verifyEmail, ...lsEmails]);
  }

  Future<bool> addStudentsSubject(int? groupId, int subjectId) async {
    try {
      List<VerifyEmail> lsEmails = List.from(state.lsEmails);
      List<String> lsVerifiedEmails = lsEmails
          .where((element) => element.isEmailValid)
          .map((e) => e.email)
          .toList();

      final res = await subjectsRepository.addStudentsSubject(
          groupId, subjectId, lsVerifiedEmails);

      if (res.isNotEmpty) {
        _setAddStudentsSubject(res);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  _setAddStudentsSubject(List<StudentGroupSubject> lsStudentsSubject) {
    state = state.copyWith(lsStudentsSubject: lsStudentsSubject);
  }

  Future<void> getStudentsSubject(int subjectId) async {
    try {
      final lsStudentsSubject =
          await subjectsRepository.getStudentsSubject(subjectId);
      _setStudentsSubject(lsStudentsSubject);
    } catch (e) {
      print(e);
    }
  }

  _setStudentsSubject(List<StudentGroupSubject> lsStudentsSubject) {
    List<StudentGroupSubject> lsStudents = List.from(state.lsStudentsSubject);
    state = state
        .copyWith(lsStudentsSubject: [...lsStudentsSubject, ...lsStudents]);
  }

  void clearSubjectTeacherOptionsLs() {
    state = state.copyWith(lsEmails: [], lsStudentsSubject: []);
  }
}