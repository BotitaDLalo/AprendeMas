import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/models/activities/activity/activity.dart';
import 'package:aprende_mas/providers/activity_state/activity_state.dart';
import 'package:aprende_mas/repositories/Interface_repos/activity/activity_repository.dart';

class ActivityNotifier extends StateNotifier<ActivityState> {
  final ActivityRepository activityRepository;

  ActivityNotifier({required this.activityRepository}) : super(ActivityState());

  // Método para cargar todas las actividades desde el repositorio
  Future<void> getAllActivities(int materiaId) async {
    try {
      state = state.copyWith(isLoading: true); // Indicando que está cargando
      final activities = await activityRepository.getAllActivities(materiaId);
      _setActivities(activities); // Aquí actualizamos el estado
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } finally {
      state =
          state.copyWith(isLoading: false); // Indicando que terminó la carga
    }
  }

  // Método privado para actualizar el estado con nuevas actividades
  void _setActivities(List<Activity> activities) {
    state = state.copyWith(activities: activities);
  }

  Future<void> createdActivity(
    int materiaId,
    String nombreActividad,
    String descripcion,
    DateTime fechaLimite,
    int puntaje
  ) async {
    try {
      state = state.copyWith(isLoading: true); // Indicando que está cargando
      final activity = await activityRepository.createdActivity(
          materiaId, nombreActividad, descripcion, fechaLimite, puntaje);
      _setCreatedActivity(activity);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } finally {
      state =
          state.copyWith(isLoading: false); // Indicando que terminó la carga
    }
  }

  void _setCreatedActivity(List<Activity> activity) {
    state = state.copyWith(activities: activity);
  }

  Future<void> getSubmissions(int activityId) async {
    try {
      final lsSubmisions = await activityRepository.getSubmissions(activityId);
      _setLsSubmissions(lsSubmisions);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> sendSubmission(int activityId, String answer) async {
    try {
      //TODO: METODO DLE REPOSITORY
      final submissionSent =
          await activityRepository.sendSubmission(activityId, answer);
      if (submissionSent.isNotEmpty) {
        _setLsSubmissions(submissionSent);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> cancelSubmission(int studentActivityId, int activityId) async {
    try {
      final cancelSubmission = await activityRepository.cancelSubmission(
          studentActivityId, activityId);

      _setLsSubmissions(cancelSubmission);
    } catch (e) {
      throw Exception(e);
    }
  }

  void _setLsSubmissions(List<Submission> lsSubmisions) {
    state = state.copyWith(lsSubmissions: lsSubmisions);
  }
}

