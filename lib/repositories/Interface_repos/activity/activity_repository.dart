import 'package:aprende_mas/models/activities/activity/activity.dart';

abstract class ActivityRepository {
  Future<List<Activity>> getAllActivities(int materiaId);

  Future<List<Activity>> createdActivity(
    int materiaId, String nombreActividad, String descripcion, DateTime fechaLimite);
  
  Future<Activity> updateActivity(
    int activityId ,String nombreActividad, String descripcion, DateTime fechaLimite);  
}