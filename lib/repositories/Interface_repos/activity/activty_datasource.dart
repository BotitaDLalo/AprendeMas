import 'package:aprende_mas/models/activities/activity/activity.dart';

abstract class ActivityDataSource {
  Future<List<Activity>> getAllActivities(int materiaId);

  Future<List<Activity>> createdActivity(
    String nombreActividad, String descripcion, DateTime fechaCreacion, DateTime fechaLimite, int tipoActividadId);
  
  Future<Activity> updateActivity(
    int activityId ,String nombreActividad, String descripcion, DateTime fechaCreacion, DateTime fechaLimite, int tipoActividadId);  
}