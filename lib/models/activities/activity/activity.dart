class Activity {
  final int actividadId;
  final String nombreActividad;
  final String descripcion;
  final DateTime fechaCreacion;
  final DateTime fechaLimite;
  final int tipoActividadId;
  final String? puntaje;
  final int materiaId;

  Activity(
      {required this.actividadId,
      this.puntaje,
      required this.nombreActividad,
      required this.descripcion,
      required this.tipoActividadId,
      required this.fechaCreacion,
      required this.fechaLimite,
      required this.materiaId});
}