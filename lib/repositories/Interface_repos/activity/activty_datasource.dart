import 'package:aprende_mas/models/models.dart';

abstract class ActivityDataSource {
  Future<List<Activity>> getAllActivities(int materiaId);

  Future<List<Activity>> createdActivity(int materiaId, String nombreActividad,
      String descripcion, DateTime fechaLimite);

  Future<Activity> updateActivity(int activityId, String nombreActividad,
      String descripcion, DateTime fechaLimite);

  Future<List<Submission>> sendSubmission(int activityId, String answer);

  Future<List<Submission>> getSubmissions(int activityId);

  Future<List<Submission>> cancelSubmission(
      int studentActivityId, int activityId);

}
