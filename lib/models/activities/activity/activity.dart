class Activity {
  final int docenteId;
  final String nombre;
  final String descripcion;
  final int tipoActividadId;
  final int rubricaId;
  final DateTime fechaCreacion;
  final DateTime fechaLimite;
  final int puntuacion;

  Activity(
      {required this.docenteId,
      required this.nombre,
      required this.descripcion,
      required this.tipoActividadId,
      required this.rubricaId,
      required this.fechaCreacion,
      required this.fechaLimite,
      required this.puntuacion});
}