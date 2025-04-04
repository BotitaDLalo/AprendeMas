class Submission {
  final int studentActivityId;
  final int submissionId;
  String? answer;
  String? grade;
  String? link;
  String? file;
  int? activityId;
  final bool status;
  final String? submissionDate;

  Submission(
      {required this.studentActivityId,
      required this.submissionId,
      this.submissionDate,
      this.answer,
      this.link,
      this.file,
      this.grade,
      this.activityId,
      required this.status});

  static List<Submission> submissionJsonToEntity(
      Map<String, dynamic> submissionRes, int activityId) {
    int gradeRes = submissionRes['calificacion'] as int;
    return [
      Submission(
          studentActivityId: submissionRes['alumnoActividadId'],
          submissionId: submissionRes['entregaId'],
          activityId: activityId,
          answer: submissionRes['respuesta'],
          submissionDate: submissionRes['fechaEntrega'],
          status: submissionRes['status'],
          grade: gradeRes == 0 ? null : gradeRes.toString())
    ];
  }

  static List<Submission> activitiesBySubject(
      List<Submission> lsActivities, int activityId) {
    return lsActivities
        .where(
          (element) => element.activityId == activityId,
        )
        .toList();
  }
}
