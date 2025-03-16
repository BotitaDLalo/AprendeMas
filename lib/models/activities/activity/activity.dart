import 'package:intl/intl.dart';
import 'package:aprende_mas/config/utils/general_utils.dart';

class Activity {
  final int activityId;
  final String nombreActividad;
  final String descripcion;
  final String fechaCreacion;
  final String fechaLimite;
  final int tipoActividadId;
  final int? puntaje;
  final int materiaId;

  Activity(
      {required this.activityId,
      this.puntaje,
      required this.nombreActividad,
      required this.descripcion,
      required this.tipoActividadId,
      required this.fechaCreacion,
      required this.fechaLimite,
      required this.materiaId});

  static final DateFormat dateTimeFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');

  static List<Activity> queryToEntityActivity(
      List<Map<String, Object?>> querylsActivities) {
    final lsActivities = querylsActivities
        .map(
          (e) => Activity(
              activityId: e['ActividadId'] as int,
              nombreActividad: e['NombreActividad'] as String,
              descripcion: e['Descripcion'] as String,
              tipoActividadId: e['TipoActividadId'] as int,
              fechaCreacion: formatDate(e['FechaCreacion'] as String),
              fechaLimite: formatDate(e['FechaLimite'] as String),
              materiaId: e['MateriaId'] as int,
              puntaje: e['Puntaje'] as int),
        )
        .toList();

    return lsActivities;
  }

  static List<Activity> activitiesBySubject(
      List<Activity> lsActivities, int subjectId) {
    return lsActivities
        .where(
          (element) => element.materiaId == subjectId,
        )
        .toList();
  }
}
