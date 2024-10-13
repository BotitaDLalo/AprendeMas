
import 'package:aprende_mas/models/groups/groups.dart';

import '../../activities/activities.dart';
import '../../subjects/subjects.dart';

class GroupsMapper {
  static List<Group> groupsJsonToEntityList(List<Map<String, dynamic>> groupsAndSubject){
     List<Group> groups = [];

    for (var group in groupsAndSubject) {
      // Cargar materias de cada grupo
      List<Subject> materias = (group['materias'] as List).map((materia) {
        // Cargar actividades de cada materia
        List<Activities> actividades =
            (materia['actividades'] as List).map((actividad) {
          return Activities(
            nombreActividad: actividad['nombreActividad'],
            descripcion: actividad['descripcion'],
            fechaCreacion: actividad['fechaCreacion'],
          );
        }).toList();

        return Subject(
          nombreMateria: materia['nombreMateria'],
          descripcion: materia['descripcion'],
          codigoColor: materia['codigoColor'],
          actividades: actividades, // Asignar las actividades a la materia
        );
      }).toList();

      // Crear el grupo y añadirlo a la lista
      groups.add(Group(
        nombreGrupo: group['nombreGrupo'],
        descripcion: group['descripcion'],
        codigoAcceso: group['codigoAcceso'],
        tipoUsuario: group['tipoUsuario'],
        codigoColor: group['codigoColor'],
        materias: materias, // Asignar las materias al grupo
      ));
    }
    return groups;
  }
}