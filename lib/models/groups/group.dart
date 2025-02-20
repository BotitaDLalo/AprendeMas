import 'dart:ui';
import 'package:aprende_mas/config/utils/general_utils.dart';
import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/models/models.dart';

class Group {
  final int? grupoId;
  final String nombreGrupo;
  final String? descripcion;
  final String? codigoAcceso;
  // final String codigoColor;
  final List<Subject>? materias;

  Group({
    this.grupoId,
    required this.nombreGrupo,
    this.descripcion,
    this.codigoAcceso,
    // required this.codigoColor,
    this.materias,
  });

  static Group empty() => Group(
      grupoId: -1,
      descripcion: '',
      nombreGrupo: '',
      codigoAcceso: '',
      // codigoColor: ''
      );

  static List<Group> groupsJsonToEntityList(
      List<Map<String, dynamic>> groupsAndSubject) {
    List<Group> groups = [];

    for (var group in groupsAndSubject) {
      List<Subject> materias =
          (group['materias'] as List? ?? []).map((materia) {
        List<Activity> actividades =
            (materia['actividades'] as List).map((actividad) {
          return Activity(
              actividadId: actividad['actividadId'],
              nombreActividad: actividad['nombreActividad'],
              descripcion: actividad['descripcion'],
              tipoActividadId: actividad['tipoActividadId'],
              fechaCreacion: formatDate(actividad['fechaCreacion']),
              fechaLimite: formatDate(actividad['fechaLimite']),
              puntaje: actividad['puntaje'],
              materiaId: actividad['materiaId']);
        }).toList();

        return Subject(
          materiaId: materia['materiaId'],
          nombreMateria: materia['nombreMateria'],
          descripcion: materia['descripcion'] ?? "",
          codigoColor: materia['codigoColor'] ?? "",
          codigoAcceso: materia['codigoAcceso'] ?? "",
          actividades: actividades, // Asignar las actividades a la materia
        );
      }).toList();

      groups.add(Group(
        grupoId: group['grupoId'],
        nombreGrupo: group['nombreGrupo'],
        descripcion: group['descripcion'] ?? "",
        codigoAcceso: group['codigoAcceso'] ?? "",
        // codigoColor: mainColorToHex,
        materias: materias,
      ));
    }
    return groups;
  }

  static Group groupToEntity(Map<String, dynamic> group) => Group(
      grupoId: group['grupoId'],
      nombreGrupo: group['nombreGrupo'],
      descripcion: group['descripcion'],
      codigoAcceso: group['codigoAcceso'],
      // codigoColor: group['codigoColor']
      
      );

  static Group queryToEntityGroup(Map<String, Object?> queryGroup) {
    final group = queryGroup as Group;
    return Group(
        nombreGrupo: group.nombreGrupo,
        descripcion: group.descripcion,
        codigoAcceso: group.codigoAcceso,
        // codigoColor: group.codigoColor
        
        );
  }
}
