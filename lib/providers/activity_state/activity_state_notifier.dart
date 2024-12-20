import 'package:aprende_mas/config/utils/packages.dart';
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
      debugPrint('ActivityNotifier Fetching activities for materiaId: $materiaId');
      final activities = await activityRepository.getAllActivities(materiaId);
      _setActivities(activities); // Aquí actualizamos el estado
      debugPrint('Activities set in state: ${state.activities.length}');
    } catch (e) {
      debugPrint('Error fetching activities: $e');
      state = state.copyWith(errorMessage: e.toString());
    } finally {
      state = state.copyWith(isLoading: false); // Indicando que terminó la carga
    }
  }

  // Método para filtrar actividades por subjectId
  // List<Activity> getActivitiesBySubjectId(int materiaId) {
  //   return state.activities
  //       .where((activity) => activity.materiaId == materiaId)
  //       .toList();
  // }

  // Método privado para actualizar el estado con nuevas actividades
  void _setActivities(List<Activity> activities) {
    state = state.copyWith(activities: activities);
  }
}
