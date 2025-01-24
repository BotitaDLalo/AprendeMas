import 'package:aprende_mas/models/models.dart';

class SubjectsState {
  final List<Subject> subjects;
  final List<VerifyEmail> lsEmails;
  final List<StudentGroupSubject> lsStudentsSubject;

  SubjectsState(
      {this.subjects = const [],
      this.lsStudentsSubject = const [],
      this.lsEmails = const []});

  SubjectsState copyWith(
          {List<Subject>? subjects,
          List<VerifyEmail>? lsEmails,
          List<StudentGroupSubject>? lsStudentsSubject}) =>
      SubjectsState(
          subjects: subjects ?? this.subjects,
          lsEmails: lsEmails ?? this.lsEmails,
          lsStudentsSubject: lsStudentsSubject ?? this.lsStudentsSubject);
}
