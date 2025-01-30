class Submission {
  final int studentActivityId;
  String? answer;
  String? link;
  String? file;
  int? activityId;
  final bool status;
  final String? submissionDate;

  Submission(
      {required this.studentActivityId,
      this.submissionDate,
      this.answer,
      this.link,
      this.file,
      this.activityId,
      required this.status});

  static List<Submission> submissionJsonToEntity(
          Map<String, dynamic> submissionRes, int activityId) =>
      [
        Submission(
            studentActivityId: submissionRes['alumnoActividadId'],
            activityId: activityId,
            answer: submissionRes['respuesta'],
            submissionDate: submissionRes['fechaEntrega'],
            status: submissionRes['status'])
      ];

  static List<Submission> activitiesBySubject(
      List<Submission> lsActivities, int activityId) {
    return lsActivities
        .where(
          (element) => element.activityId == activityId,
        )
        .toList();
  }
}
