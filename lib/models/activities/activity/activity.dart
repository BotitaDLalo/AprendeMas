class Activity {
  final int activityId;
  final String nombreActividad;
  final String descripcion;
  final DateTime fechaCreacion;
  final DateTime fechaLimite;
  final int tipoActividadId;
  final int materiaId;
  final int puntaje;

  Activity(
      {required this.activityId,
      required this.nombreActividad,
      required this.descripcion,
      required this.tipoActividadId,
      required this.fechaCreacion,
      required this.fechaLimite,
      required this.materiaId,
      required this.puntaje
      });
}