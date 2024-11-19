import 'package:aprende_mas/models/activities/activity/activity.dart';

abstract class ActivityRepository {
  Future<List<Activity>> getAllActivities();
  Future<Activity?> getActivityByName(String nombre);
  Future<void> addActivity(Activity activity);
}