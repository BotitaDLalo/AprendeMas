import 'student_submission.dart';

class ActivityStudentSubmissionsData {
  final int activityId;
  final int score;
  final int totalSubmissions;
  List<StudentSubmission> lsStudentsSubmissions;
  ActivityStudentSubmissionsData(
      {required this.activityId,
      required this.score,
      required this.totalSubmissions,
      required this.lsStudentsSubmissions});

  static ActivityStudentSubmissionsData init() {
    return ActivityStudentSubmissionsData(
        activityId: -1,
        score: 0,
        totalSubmissions: 0,
        lsStudentsSubmissions: []);
  }

  static ActivityStudentSubmissionsData responseToEntity(
      Map<String, dynamic> response) {
    final lsResponse = response['alumnosEntregables'] as List<dynamic>;
    return ActivityStudentSubmissionsData(
        activityId: response['actividadId'] as int,
        score: response['puntaje'] as int,
        totalSubmissions: response['totalEntregados'] as int,
        lsStudentsSubmissions: lsResponse
            .map(
              (e) => StudentSubmission(
                  submissionId: e['entregaId'] as int,
                  studentId: e['alumnoId'] as int,
                  userName: e['nombreUsuario'] as String,
                  names: e['nombres'] as String,
                  lastName: e['apellidoPaterno'] as String,
                  lastName2: e['apellidoMaterno'] as String,
                  submissionDate: e['fechaEntrega'].toString(),
                  answer: e['respuesta'] as String,
                  grade: e['calificacion'] as int),
            )
            .toList());
  }
}
