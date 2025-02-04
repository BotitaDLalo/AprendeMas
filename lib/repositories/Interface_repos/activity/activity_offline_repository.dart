import 'package:aprende_mas/models/models.dart';

abstract class ActivityOfflineRepository {
  Future<List<Activity>> getAllActivitiesOffline(int subjectId);

  Future<void> saveSubmissions(List<Submission> lsSubmissions, int activityId);

  Future<List<Submission>> getSubmissionsOffline(int activityId);
  Future<List<Submission>> sendSubmissionOffline(int activityId, String answer);
  Future<List<Submission>> getSubmissionsPending(int activityId);
}
