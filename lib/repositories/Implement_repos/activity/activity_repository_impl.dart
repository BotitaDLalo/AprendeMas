import 'package:aprende_mas/models/activities/activity/activity.dart';
import 'package:aprende_mas/models/activities/activity/activity_mapper.dart';
import 'package:aprende_mas/repositories/Interface_repos/activity/activity_repository.dart';
import 'package:aprende_mas/views/shared/local_data_activities.dart';
// import 'package:modulo_actividades/views/shared/local_data_activities.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  @override
  Future<List<Activity>> getAllActivities() async {
    // Simulación de retraso de carga
    await Future.delayed(Duration(milliseconds: 500));

    // Convierte el JSON simulado a una lista de objetos Activity
    return activities.map((map) => ActivityMapper.fromMap(map)).toList();
  }

  @override
  Future<Activity?> getActivityByName(String nombre) async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      final foundMap = activities.firstWhere((map) => map['nombre'] == nombre);
      return ActivityMapper.fromMap(foundMap);
    } catch (e) {
      return null; // Retorna null si no encuentra la actividad
    }
  }

  @override
  Future<void> addActivity(Activity activity) async {
    activities.add(ActivityMapper.toMap(activity)); // Agrega al JSON simulado
  }
}
