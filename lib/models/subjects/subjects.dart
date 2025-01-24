import 'package:aprende_mas/models/models.dart';

class Subject {
  final int? groupId;
  final int materiaId;
  final String nombreMateria;
  final String? codigoAcceso;
  final String? descripcion;
  final String? codigoColor;
  // final List<Activities>? actividades;
  final List<Activity>? actividades;

  Subject({
    this.groupId,
    required this.materiaId,
    required this.nombreMateria,
    this.codigoAcceso,
    this.descripcion,
    this.codigoColor,
    this.actividades,
  });
}
