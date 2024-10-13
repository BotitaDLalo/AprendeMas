import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/repositories/Interface_repos/groups/groups_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../views/shared/local_data_groups.dart';

// Clase Notifier para manejar el estado de los grupos
class GroupsNotifier extends StateNotifier<List<Group>> {
  final GroupsRepository groupsRepository;

  GroupsNotifier({required this.groupsRepository}) : super([]) {
    //* Cargar grupos inicialmente
    getGroups();
  }

  Future<void> getGroups() async {
    try {
      final groups = await groupsRepository.getGroups();
      setGrupos(groups);
    } catch (e) {
      throw Exception(e);
    }
  }

  void setGrupos(List<Group> groups){
    state = groups;
  }

  // void getGroups(List<Map<String, dynamic>> groupsAndSubject) {
  //   List<Group> grupos = [];

  //   for (var group in groupsAndSubject) {
  //     // Cargar materias de cada grupo
  //     List<Subject> materias = (group['materias'] as List).map((materia) {
  //       // Cargar actividades de cada materia
  //       List<Activities> actividades =
  //           (materia['actividades'] as List).map((actividad) {
  //         return Activities(
  //           nombreActividad: actividad['nombreActividad'],
  //           descripcion: actividad['descripcion'],
  //           fechaCreacion: actividad['fechaCreacion'],
  //         );
  //       }).toList();

  //       return Subject(
  //         nombreMateria: materia['nombreMateria'],
  //         descripcion: materia['descripcion'],
  //         actividades: actividades, // Asignar las actividades a la materia
  //       );
  //     }).toList();

  //     // Crear el grupo y añadirlo a la lista
  //     grupos.add(Group(
  //       nombreGrupo: group['nombrGrupo'],
  //       descripcion: group['descripcion'],
  //       codigoAcceso: group['codigoAcceso'],
  //       tipoUsuario: group['tipoUsuario'],
  //       materias: materias, // Asignar las materias al grupo
  //     ));
  //   }

  //   state = grupos; // Actualiza el estado con la lista de grupos
  // }
}
