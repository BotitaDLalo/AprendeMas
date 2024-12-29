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
      final response = await dio.get(uri);

      final List<Map<String, dynamic>> data =
          List<Map<String, dynamic>>.from(response.data);

      final activities = ActivityMapper.fromMapList(data);
      return activities;

    } catch (e) {
      throw Exception("ActivityDataSourceImpl get Error al obtener actividades: $e");
    }
  }

  @override
  Future<List<Activity>> createdActivity(
      int materiaId,
      String nombreActividad,
      String descripcion,
      DateTime fechaLimite,) async{
      
      try {
        final uri = "/Actividades/CrearActividad/$materiaId";
        final response = await dio.post(uri, data: {
          "nombreActividad": nombreActividad,
          "descripcion": descripcion,
          "fechaLimite": fechaLimite.toIso8601String(),
          "materiaId": materiaId
        });
        debugPrint("Response: ${response.data}");

        final resList = List<Map<String, dynamic>>.from(response.data);
        final activities = ActivityMapper.fromMapList(resList);

        return activities;

      } catch (e) {
        throw Exception("ActivityDataSourceImpl post Error al crear una actividad: $e");
      }
  }

  @override
  Future<Activity> updateActivity(
      int activityId,
      String nombreActividad,
      String descripcion,
      DateTime fechaLimite,) {
    // TODO: implement updateActivity
    throw UnimplementedError();
  }
}
