import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/providers/activity/activity_state.dart';
import 'package:aprende_mas/repositories/Interface_repos/activity/activity_repository.dart';
import 'package:aprende_mas/repositories/Interface_repos/activity/activity_offline_repository.dart';

class ActivityNotifier extends StateNotifier<ActivityState> {
  final ActivityRepository activityRepository;
  final ActivityOfflineRepository activityOfflineRepository;

  ActivityNotifier({
    required this.activityRepository,
    required this.activityOfflineRepository,
  }) : super(ActivityState());

  List<Activity> getActivitiesBySubject(int subjectId) {
    try {
      List<Activity> lsActivities = List.from(state.activities);
      final lsActivitiesBySubject =
          Activity.activitiesBySubject(lsActivities, subjectId);
      return lsActivitiesBySubject;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> getAllActivities(int subjectId) async {
    try {
      state = state.copyWith(isLoading: true);
      final activities = await activityRepository.getAllActivities(subjectId);
      _setActivities(activities);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> getAllActivitiesOffline(int subjectId) async {
    try {
      state = state.copyWith(isLoading: true);
      final lsActivities = await activityOfflineRepository.getAllActivitiesOffline(subjectId);
      _setActivities(lsActivities);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  void _setActivities(List<Activity> activities) {
    if (activities.isNotEmpty) {
      List<Activity> lsActivities = List.from(state.activities);
      state = state.copyWith(activities: [...activities, ...lsActivities]);
    }
  }

  Future<bool> createdActivity(int materiaId, String nombreActividad,
      String descripcion, DateTime fechaLimite, int puntaje) async {
    try {
      state = state.copyWith(isLoading: true); // Indicando que está cargando
      final activity = await activityRepository.createdActivity(
          materiaId, nombreActividad, descripcion, fechaLimite, puntaje);

      if (activity.isNotEmpty) {
        _setCreatedActivity(activity);
        return true;
      }
      return false;
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
      return false;
    } finally {
      state =
          state.copyWith(isLoading: false); // Indicando que terminó la carga
    }
  }

  void _setCreatedActivity(List<Activity> activity) {
    state = state.copyWith(activities: activity);
  }

  Future<List<Submission>> getSubmissions(int activityId) async {
    try {
      final lsSubmisions = await activityRepository.getSubmissions(activityId);
      _setLsSubmissions(lsSubmisions);
      return lsSubmisions;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<bool> sendSubmission(int activityId, String answer) async {
    try {
      final submissionSent =
          await activityRepository.sendSubmission(activityId, answer);
      if (submissionSent.isNotEmpty) {
        // _setLsSubmissions(submissionSent);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> cancelSubmission(int studentActivityId, int activityId) async {
    try {
      List<Submission> lsSubmissionsState = List.from(state.lsSubmissions);

      await activityRepository.cancelSubmission(studentActivityId, activityId);

      List<Submission> lsSubmissions = lsSubmissionsState
          .where((element) => element.studentActivityId != studentActivityId)
          .toList();
      _updateLsSubmissions(lsSubmissions);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> sendSubmissionOffline(int activityId, String answer) async {
    try {
      final submissionSent = await activityOfflineRepository
          .sendSubmissionOffline(activityId, answer);
      if (submissionSent.isNotEmpty) {
        _setLsSubmissions(submissionSent);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<List<Submission>> getSubmissionsOffline(int activityId) async {
    try {
      final lsSubmissions =
          await activityOfflineRepository.getSubmissionsOffline(activityId);
      _setLsSubmissions(lsSubmissions);
      return lsSubmissions;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  void _updateLsSubmissions(List<Submission> lsSubmisions) {
    state = state.copyWith(lsSubmissions: lsSubmisions);
  }

  void _setLsSubmissions(List<Submission> lsSubmisions) {
    List<Submission> lsSubmisionsState = List.from(state.lsSubmissions);
    state =
        state.copyWith(lsSubmissions: [...lsSubmisionsState, ...lsSubmisions]);
  }

  void setSubmissionGrade(int grade) {
    state = state.copyWith(grade: grade);
  }

  Future<bool> submissionGrading(
      {required int submissionId, required int grade}) async {
    try {
      final res =
          await activityRepository.submissionGrading(submissionId, grade);
      return res;
    } catch (e) {
      return false;
    }
  }

  void clearActivityState() {
    state = ActivityState();
  }

  void clearSubmissionData() {
    state = state.copyWith(grade: 0);
  }
}
