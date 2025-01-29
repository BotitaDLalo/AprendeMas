class Submission {
  final int studentActivityId;
  final String answer;
  final bool status;

  Submission(
      {required this.studentActivityId,
      required this.answer,
      required this.status});

  static List<Submission> submissionJsonToEntity(
          Map<String, dynamic> submissionRes) =>
      [
        Submission(
            studentActivityId: submissionRes['alumnoActividadId'],
            answer: submissionRes['respuesta'],
            status: submissionRes['status'])
      ];
}
