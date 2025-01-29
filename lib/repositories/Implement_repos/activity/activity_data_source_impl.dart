import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/config/network/dio_client.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/activities/activity/activity.dart';
import 'package:aprende_mas/models/activities/activity/activity_mapper.dart';
import 'package:aprende_mas/repositories/Interface_repos/activity/activty_datasource.dart';
import 'package:aprende_mas/config/data/data.dart';

class ActivityDataSourceImpl implements ActivityDataSource {
  final storageService = KeyValueStorageServiceImpl();
  @override
  Future<List<Activity>> getAllActivities(int materiaId) async {
    try {
      final uri = "/Actividades/ObtenerActividadesPorMateria/$materiaId";
      final response = await dio.get(uri);

      final List<Map<String, dynamic>> data =
          List<Map<String, dynamic>>.from(response.data);
      
      debugPrint("Respuesta del backend: ${response.data}");

      final activities = ActivityMapper.fromMapList(data);
      return activities;
    } catch (e) {
      throw Exception(
          "ActivityDataSourceImpl get Error al obtener actividades: $e");
    }
  }

  @override
  Future<List<Activity>> createdActivity(
    int materiaId,
    String nombreActividad,
    String descripcion,
    DateTime fechaLimite,
  ) async {
    try {
      const uri = "/Actividades/CrearActividad";
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
      throw Exception(
          "ActivityDataSourceImpl post Error al crear una actividad: $e");
    }
  }

  @override
  Future<Activity> updateActivity(
    int activityId,
    String nombreActividad,
    String descripcion,
    DateTime fechaLimite,
  ) {
    // TODO: implement updateActivity
    throw UnimplementedError();
  }

  @override
  Future<List<Submission>> sendSubmission(int activityId, String answer) async {
    try {
      const uri = "/Alumnos/RegistrarEnvioActividadAlumno";
      DateTime dateNow = DateTime.now();
      final id = await storageService.getId();

      final res = await dio.post(uri, data: {
        "AlumnoId": id,
        "Respuesta": answer,
        "ActividadId": activityId,
        "FechaEntrega": dateNow.toString()
      });

      if (res.statusCode == 200) {
        final resList = Map<String, dynamic>.from(res.data);

        final list = Submission.submissionJsonToEntity(resList);

        return list;
      }

      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<List<Submission>> getSubmissions(int activityId) async {
    try {
      const uri = "/Alumnos/ObtenerEnviosActividadesAlumno";
      final id = await storageService.getId();

      final res = await dio.get(uri,
          queryParameters: {"ActividadId": activityId, "AlumnoId": id});
      if (res.statusCode == 200) {
        final resList = Map<String, dynamic>.from(res.data);

        final list = Submission.submissionJsonToEntity(resList);

        return list;
      }

      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<List<Submission>> cancelSubmission(
      int studentActivityId, int activityId) async {
    try {
      const uri = "/Alumnos/CancelarEnvioActividadAlumno";
      final id = await storageService.getId();

      final res = await dio.post(uri, data: {
        "AlumnoActividadId": studentActivityId,
        "ActividadId": activityId,
        "AlumnoId": id
      });

      if (res.statusCode == 200) {
        final resList = Map<String, dynamic>.from(res.data);

        final list = Submission.submissionJsonToEntity(resList);

        return list;
      }

      return [];
    } catch (e) {
      return [];
    }
  }
}
