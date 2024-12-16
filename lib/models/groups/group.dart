import 'package:aprende_mas/models/models.dart';

class Group {
  final int? grupoId;
  final String nombreGrupo;
  final String? descripcion;
  final String? codigoAcceso;
  // final String tipoUsuario;
  final String codigoColor;
  final List<Subject>? materias;

  Group({
    this.grupoId,
    required this.nombreGrupo,
    this.descripcion,
    this.codigoAcceso,
    // required this.tipoUsuario,
    required this.codigoColor,
    this.materias,
  });
}