import 'package:aprende_mas/models/activities/activity/activity.dart';
import 'package:aprende_mas/repositories/Implement_repos/activity/activity_data_source_impl.dart';
import 'package:aprende_mas/repositories/Interface_repos/activity/activity_repository.dart';
import 'package:aprende_mas/repositories/Interface_repos/activity/activty_datasource.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  final ActivityDataSource activityDataSource;

  ActivityRepositoryImpl({ActivityDataSource? activityDataSource})
  : activityDataSource = activityDataSource ?? ActivityDataSourceImpl();
  
  @override
  Future<List<Activity>> getAllActivities(int materiaId) async {
    final activities = await activityDataSource.getAllActivities(materiaId);
    return activities;
  }
  
  @override
  Future<Activity> updateActivity(int activityId, String nombreActividad, String descripcion, DateTime fechaLimite) {
    // TODO: implement updateActivity
    throw UnimplementedError();
  }
  
  @override
  Future<List<Activity>> createdActivity(int materiaId, String nombreActividad, String descripcion, DateTime fechaLimite) {
    return activityDataSource.createdActivity(materiaId, nombreActividad, descripcion, fechaLimite);
  }
}
