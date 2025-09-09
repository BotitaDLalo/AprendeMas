class StudentSubmission {
  final int submissionId;
  final int studentId;
  final String userName;
  final String names;
  final String lastName;
  final String lastName2;
  final String submissionDate;
  final String answer;
   int grade;

  StudentSubmission(
      {required this.submissionId,
      required this.studentId,
      required this.userName,
      required this.names,
      required this.lastName,
      required this.lastName2,
      required this.submissionDate,
      required this.answer,
      required this.grade});
}
