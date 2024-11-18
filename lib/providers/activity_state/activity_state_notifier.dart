import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/activities/activity/activity.dart';
import 'package:aprende_mas/providers/activity_state/activity_state.dart';
import 'package:aprende_mas/repositories/Interface_repos/activity/activity_repository.dart';

class ActivityStateNotifier extends StateNotifier<ActivityState> {
  final ActivityRepository repository;

  ActivityStateNotifier({required this.repository}) : super(ActivityState());

  // Cargar actividades desde el repositorio
  Future<void> loadActivities() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      print('Cargando actividades...');
      final activities = await repository.getAllActivities();
      print('Actividades cargadas: $activities');
      state = state.copyWith(activities: activities, isLoading: false);
    } catch (e) {
      print('Error al cargar actividades: $e');
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Error al cargar actividades',
      );
    }
  }

  // Agregar una nueva actividad
  Future<void> addActivity(Activity activity) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      await repository.addActivity(activity);
      // Agregar la actividad localmente
      final updatedActivities = [...state.activities, activity];
      state = state.copyWith(activities: updatedActivities, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Error al agregar la actividad',
      );
    }
  }
}