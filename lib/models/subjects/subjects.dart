import 'package:aprende_mas/models/models.dart';

class Subject {
  final String nombreMateria;
  final String? descripcion;
  final String? codigoColor;
  final List<Activities>? actividades;

  Subject({
    required this.nombreMateria,
    this.descripcion,
    this.codigoColor,
    this.actividades,
  });

  Map<String, dynamic> toJsonGroupsSubjects() {
    return {
      "NombreMateria": nombreMateria,
      if (descripcion != null) "Descripcion": descripcion,
      // if (codigoColor != null) "codigoColor": codigoColor
    };
  }
}
