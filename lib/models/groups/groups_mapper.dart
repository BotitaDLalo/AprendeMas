import 'package:aprende_mas/models/models.dart';

class GroupsMapper {
  static List<Group> groupsJsonToEntityList(
      List<Map<String, dynamic>> groupsAndSubject) {
    List<Group> groups = [];

    for (var group in groupsAndSubject) {
      // Cargar materias de cada grupo
      List<Subject> materias =
          (group['materias'] as List? ?? []).map((materia) {
        // List<Subject> materias = (group['materias'] as List).map((materia) {
        // Cargar actividades de cada materia
        List<Activity> actividades =
            (materia['actividades'] as List).map((actividad) {
          return Activity(
              actividadId: actividad['actividadId'],
              nombreActividad: actividad['nombreActividad'],
              descripcion: actividad['descripcion'],
              tipoActividadId: actividad['tipoActividadId'],
              fechaCreacion: DateTime.parse(actividad['fechaCreacion']),
              fechaLimite: DateTime.parse(actividad['fechaLimite']),
              puntaje: actividad['puntaje'].toString(),
              materiaId: actividad['materiaId']);
        }).toList();

        return Subject(
          materiaId: materia['materiaId'],
          nombreMateria: materia['nombreMateria'],
          descripcion: materia['descripcion'],
          codigoColor: materia['codigoColor'],
          codigoAcceso: materia['codigoAcceso'],
          actividades: actividades, // Asignar las actividades a la materia
        );
      }).toList();

      // Crear el grupo y añadirlo a la lista
      groups.add(Group(
        grupoId: group['grupoId'],
        nombreGrupo: group['nombreGrupo'],
        descripcion: group['descripcion'],
        codigoAcceso: group['codigoAcceso'],
        codigoColor: group['codigoColor'],
        materias: materias,
      ));
    }
    return groups;
  }
}
