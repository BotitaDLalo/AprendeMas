import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/activities/activity/activity.dart';
import 'package:aprende_mas/repositories/Implement_repos/activity/activity_data_source_impl.dart';
import 'package:aprende_mas/repositories/Interface_repos/activity/activity_repository.dart';
import 'package:aprende_mas/repositories/Interface_repos/activity/activty_datasource.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  final ActivityDataSource activityDataSource;

  ActivityRepositoryImpl({ActivityDataSource? activityDataSource})
  : activityDataSource = activityDataSource ?? ActivityDataSourceImpl();
  
  @override
  Future<List<Activity>> createdActivity(String nombreActividad, String descripcion, DateTime fechaCreacion, DateTime fechaLimite, int tipoActividadId) {
    throw UnimplementedError();
  }
  
  @override
  Future<Activity> updateActivity(int activityId, String nombreActividad, String descripcion, DateTime fechaCreacion, DateTime fechaLimite, int tipoActividadId) {
    // TODO: implement updateActivity
    throw UnimplementedError();
  }
  
  @override
  Future<List<Activity>> getAllActivities(int materiaId) async {
    final activities = await activityDataSource.getAllActivities(materiaId);
    debugPrint('ActivityRepositoryImpl Activities fetched in repository: ${activities.length}');
    return activities;
  }
}
