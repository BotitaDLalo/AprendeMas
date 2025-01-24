import 'package:aprende_mas/models/activities/activity/activity.dart';

abstract class ActivityDataSource {
  Future<List<Activity>> getAllActivities(int materiaId);

  Future<List<Activity>> createdActivity(
    int materiaId, String nombreActividad, String descripcion, DateTime fechaLimite, int puntaje);
  
  Future<Activity> updateActivity(
    int activityId ,String nombreActividad, String descripcion, DateTime fechaLimite);  
}