import 'package:aprende_mas/models/activities/activity/activity.dart';
import 'package:aprende_mas/repositories/Implement_repos/activity/activity_data_source_impl.dart';
import 'package:aprende_mas/repositories/Interface_repos/activity/activity_offline_datasource.dart';
import 'package:aprende_mas/repositories/Interface_repos/activity/activity_repository.dart';
import 'package:aprende_mas/repositories/Interface_repos/activity/activty_datasource.dart';
import 'package:aprende_mas/models/models.dart';

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
  Future<List<Activity>> createdActivity(int materiaId, String nombreActividad, String descripcion, DateTime fechaLimite, int puntaje) {
    return activityDataSource.createdActivity(materiaId, nombreActividad, descripcion, fechaLimite, puntaje);
  }
  
  @override
  Future<List<Submission>> sendSubmission(int activityId, String answer) {
    return activityDataSource.sendSubmission(activityId, answer);
  }
  
  @override
  Future<List<Submission>> getSubmissions(int activityId) {
    return activityDataSource.getSubmissions(activityId);
  }
  
  @override
  Future<List<Submission>> cancelSubmission(int studentActivityId, int activityId) {
    return activityDataSource.cancelSubmission(studentActivityId,activityId);
  }
  
  @override
  Future<ActivityStudentSubmissionsData> getStudentSubmissions(int activityId) {
    return activityDataSource.getStudentSubmissions(activityId);
  }
  
  @override
  Future<bool> submissionGrading(int submissionId, int grade) {
    return activityDataSource.submissionGrading(submissionId, grade);
  }
  




  
}
