import 'package:aprende_mas/models/models.dart';

class Subject {
  final int subjectId;
  final String nombreMateria;
  final String? descripcion;
  final String? codigoColor;
  final List<Activities>? actividades;

  Subject({
    required this.subjectId,
    required this.nombreMateria,
    this.descripcion,
    this.codigoColor,
    this.actividades,
  });
}
