import 'package:aprende_mas/models/models.dart';

class StudentsSubjectState {
  final List<VerifyEmail> lsEmails;
  final List<StudentGroupSubject> lsStudentsSubject;

  StudentsSubjectState(
      {this.lsEmails = const [], this.lsStudentsSubject = const []});

  StudentsSubjectState copyWith(
          {List<VerifyEmail>? lsEmails,
          List<StudentGroupSubject>? lsStudentsSubject}) =>
      StudentsSubjectState(
          lsEmails: lsEmails ?? this.lsEmails,
          lsStudentsSubject: lsStudentsSubject ?? this.lsStudentsSubject);
}
