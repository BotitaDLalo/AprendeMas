class TeacherStudentSubmissionGradingModel {
  final int submissionId;
  final String userName;
  final String fullName;
  final String answer;
  final int grade;
  final int score;

  TeacherStudentSubmissionGradingModel({
    required this.submissionId,
    required this.userName,
    required this.fullName,
    required this.answer,
    required this.grade,
    required this.score,
  });
}
