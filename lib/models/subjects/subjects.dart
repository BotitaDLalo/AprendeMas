import 'package:aprende_mas/models/models.dart';

class Subject {
  final String nombreMateria;
  final String? descripcion;
  final List<Activities>? actividades;

  Subject({
    required this.nombreMateria,
    this.descripcion,
    this.actividades, 
  });
}