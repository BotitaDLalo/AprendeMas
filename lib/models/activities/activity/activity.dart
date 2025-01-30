import 'package:intl/intl.dart';

class Activity {
  final int actividadId;
  final String nombreActividad;
  final String descripcion;
  final DateTime fechaCreacion;
  final DateTime fechaLimite;
  final int tipoActividadId;
  final int puntaje;
  final int materiaId;

  Activity(
      {required this.actividadId,
      required this.puntaje,
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
              actividadId: e['ActividadId'] as int,
              nombreActividad: e['NombreActividad'] as String,
              descripcion: e['Descripcion'] as String,
              tipoActividadId: e['TipoActividadId'] as int,
              fechaCreacion: DateTime.parse(e['FechaCreacion'] as String),
              fechaLimite: DateTime.parse(e['FechaLimite'] as String),
              materiaId: e['MateriaId'] as int,
              puntaje: e['Puntaje'] as int
              ), 
        )
        .toList();

    return lsActivities;
  }
}
