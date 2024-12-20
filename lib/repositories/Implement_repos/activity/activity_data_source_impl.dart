import 'package:aprende_mas/config/network/dio_client.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/activities/activity/activity.dart';
import 'package:aprende_mas/models/activities/activity/activity_mapper.dart';
import 'package:aprende_mas/repositories/Interface_repos/activity/activty_datasource.dart';

class ActivityDataSourceImpl implements ActivityDataSource {
  @override
  Future<List<Activity>> getAllActivities(int materiaId) async {
    try {
      final uri = "/Actividades/ObtenerActividadesPorMateria/$materiaId";
      debugPrint('ActivityDataSourceImpl Fetching activities from: $uri');
      final response = await dio.get(uri);
      debugPrint('ActivityDataSourceImpl API Response: ${response.data}');

      final List<Map<String, dynamic>> data =
          List<Map<String, dynamic>>.from(response.data);

      final activities = ActivityMapper.fromMapList(data);
      debugPrint('Mapped activities: ${activities.length}');
      return activities;


    } catch (e) {
      debugPrint('Error in getAllActivities: $e');
      throw Exception("Error al obtener actividades: $e");
    }
  }

  @override
  Future<List<Activity>> createdActivity(
      String nombreActividad,
      String descripcion,
      DateTime fechaCreacion,
      DateTime fechaLimite,
      int tipoActividadId) {
    // TODO: implement createdActivity
    throw UnimplementedError();
  }

  @override
  Future<Activity> updateActivity(
      int activityId,
      String nombreActividad,
      String descripcion,
      DateTime fechaCreacion,
      DateTime fechaLimite,
      int tipoActividadId) {
    // TODO: implement updateActivity
    throw UnimplementedError();
  }
}
