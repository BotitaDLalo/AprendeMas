import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/config/utils/general_utils.dart';

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

  static List<Subject> subjectsJsonToEntityList(
      List<Map<String, dynamic>> subjectsJson) {
    List<Subject> lsSubjects = subjectsJson
        .map((e) => Subject(
            materiaId: e['materiaId'],
            nombreMateria: e['nombreMateria'],
            descripcion: e['descripcion'],
            codigoAcceso: e['codigoAcceso'],
            actividades: (e['actividades'] as List<dynamic>? ?? [])
                .map((e) => Activity(
                    activityId: e['actividadId'],
                    nombreActividad: e['nombreActividad'],
                    descripcion: e['descripcion'],
                    tipoActividadId: e['tipoActividadId'],
                    fechaCreacion: formatDate(e['fechaCreacion']),
                    fechaLimite: formatDate(e['fechaLimite']),
                    puntaje: e['puntaje'],
                    materiaId: e['materiaId']))
                .toList()))
        .toList();
    return lsSubjects;
  }

  static Subject mapToEntity(Map<String, dynamic> map) => Subject(
      materiaId: map['materiaId'],
      nombreMateria: map['nombreMateria'],
      descripcion: map['descripcion'],
      codigoAcceso: map['codigoAcceso'],
      actividades: (map['actividades'] as List<dynamic>? ?? [])
          .map((e) => Activity(
              activityId: e['actividadId'],
              nombreActividad: e['nombreActividad'],
              descripcion: e['descripcion'],
              tipoActividadId: e['tipoActividadId'],
              fechaCreacion: formatDate(e['fechaCreacion']),
              fechaLimite: formatDate(e['fechaLimite']),
              puntaje: e['puntaje'],
              materiaId: e['materiaId']))
          .toList());
}
