import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/providers/groups/groups_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// Definición del Provider
final subjectProvider =
    StateNotifierProvider<MateriaNotifier, List<Subject>>((ref) {
  return MateriaNotifier(ref);
});

class MateriaNotifier extends StateNotifier<List<Subject>> {
  final Ref ref;

  MateriaNotifier(this.ref) : super([]) {
    // Cargar materias inicialmente desde el archivo simulado
    cargarMaterias();
  }

  void cargarMaterias() {
    // Obtener los grupos del GrupoProvider
    final grupos = ref.read(groupsProvider);

    List<Subject> materias = [];

    // Recorre los grupos
    for (var group in grupos) {
      // Recorre las materias de cada grupo
      for (var materia in group.materias) {
        // Cargar las actividades de cada materia
        List<Activities> actividades = materia.actividades!.map((actividad) {
          return Activities(
            nombreActividad: actividad.nombreActividad,
            descripcion: actividad.descripcion,
            fechaCreacion: actividad.fechaCreacion,
          );
        }).toList();

        materias.add(Subject(
          nombreMateria: materia.nombreMateria,
          descripcion: materia.descripcion,
          codigoColor: materia.codigoColor,
          actividades: actividades,
        ));
      }
    }

    // Actualiza el estado con la lista de materias y sus actividades
    state = materias;
  }
}

