import 'package:aprende_mas/models/models.dart';

class StudentsGroupState {
  final List<VerifyEmail> lsEmails;
  final List<StudentGroupSubject> lsStudentsGroup;

  StudentsGroupState(
      {this.lsEmails = const [], this.lsStudentsGroup = const []});

  StudentsGroupState copyWith(
          {List<VerifyEmail>? lsEmails,
          List<StudentGroupSubject>? lsStudentsGroup}) =>
      StudentsGroupState(
        lsEmails: lsEmails ?? this.lsEmails,
        lsStudentsGroup: lsStudentsGroup ?? this.lsStudentsGroup
      );
}
