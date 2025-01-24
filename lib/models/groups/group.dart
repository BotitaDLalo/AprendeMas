import 'package:aprende_mas/models/models.dart';

class Group {
  final int? grupoId;
  final String nombreGrupo;
  final String? descripcion;
  final String? codigoAcceso;
  final String codigoColor;
  final List<Subject>? materias;

  Group({
    this.grupoId,
    required this.nombreGrupo,
    this.descripcion,
    this.codigoAcceso,
    required this.codigoColor,
    this.materias,
  });

  static Group queryToEntity(Map<String, Object?> queryGroup) {
    final group = queryGroup as Group;
    return Group(
        nombreGrupo: group.nombreGrupo,
        descripcion: group.descripcion,
        codigoAcceso: group.codigoAcceso,
        codigoColor: group.codigoColor);
  }
}
