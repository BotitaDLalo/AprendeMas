import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/views/shared/local_data_groups.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// Definición del Provider para las actividades

final activitiesProvider = StateNotifierProvider<ActividadNotifier, List<Activities>>((ref) {
  return ActividadNotifier();
});

class ActividadNotifier extends StateNotifier<List<Activities>> {
  ActividadNotifier() : super([]) {
    // Cargar actividades inicialmente desde el archivo simulado
    cargarActividades(groupsAndSubject); // Asegúrate de que `groupsAndSubject` esté disponible y válido
  }

  // Cargar actividades desde el archivo simulado
  void cargarActividades(List<Map<String, dynamic>> activityData) {
    List<Activities> actividades = [];

    if (activityData.isNotEmpty) {
      for (var group in activityData) {
        // Verificar si el grupo tiene materias
        if (group.containsKey('materias') && group['materias'] != null) {
          for (var materia in group['materias']) {
            // Verificar si la materia tiene actividades
            if (materia.containsKey('actividades') && materia['actividades'] != null) {
              for (var actividad in materia['actividades']) {
                // Convertir JSON a entidad y agregar a la lista de actividades
                actividades.add(LocalActivitiesModel.fromJson(actividad).toEntity());
              }
            }
          }
        }
      }
    }

    // Actualizar el estado con la lista de actividades
    state = actividades.isNotEmpty ? actividades : []; // Asigna una lista vacía si no hay actividades
  }
}