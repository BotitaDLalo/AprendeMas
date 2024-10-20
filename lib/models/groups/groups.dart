import 'package:aprende_mas/models/models.dart';

class Group {
  final String nombreGrupo;
  final String? descripcion;
  final String codigoAcceso;
  final String tipoUsuario;
  final List<Subject> materias;

  Group({
    required this.nombreGrupo,
    this.descripcion,
    required this.codigoAcceso,
    required this.tipoUsuario,
    required this.materias,
  });
}