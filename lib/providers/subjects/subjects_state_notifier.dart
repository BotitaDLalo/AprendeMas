import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/repositories/Interface_repos/subjects/subjects_repository.dart';

import '../groups/groups_provider.dart';

class SubjectsStateNotifier extends StateNotifier<List<Subject>> {
  final SubjectsRepository subjectsRepository;
  final Ref ref;

  SubjectsStateNotifier(this.ref, {required this.subjectsRepository}) : super([]) {
    getSubjectsWithGroup();
  }

  Future<void> createSubject(
      String subjectName, String description, Color colorCode) async {
    try {
      final subject = await subjectsRepository.createSubject(subjectName,description,colorCode);
      _setCreateSubject(subject);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> getSubjectsWithGroup() async {
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
          actividades: actividades, // Asignar las actividades a la materia
        ));
      }
    }

    // Actualiza el estado con la lista de materias y sus actividades
    state = materias;
  }

  void _setCreateSubject(List<Subject> subjects) {
    state = subjects;
  }
}
