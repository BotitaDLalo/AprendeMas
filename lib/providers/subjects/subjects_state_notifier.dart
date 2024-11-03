import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/providers/groups/groups_provider.dart';
import 'package:aprende_mas/providers/groups/groups_state_notifier.dart';
import 'package:aprende_mas/repositories/Interface_repos/subjects/subjects_repository.dart';

class SubjectsStateNotifier extends StateNotifier<List<Group>> {
  final SubjectsRepository subjectsRepository;
  final Ref ref;

  SubjectsStateNotifier(this.ref, {required this.subjectsRepository})
      : super([]) {
    // getSubjectsWithGroup();
  }

  // Future<void> createSubject(
  //     String subjectName, String description, Color colorCode) async {
  //   try {
  //     final subject = await subjectsRepository.createSubject(
  //         subjectName, description, colorCode);
  //     _setCreateSubject(subject);
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  Future<void> createSubjectWithGroups(String subjectName, String description,
      Color colorCode, List<int> groupsId) async {
    try {
      final subject = await subjectsRepository.createSubjectWithGroup(
          subjectName, description, colorCode, groupsId);
      _setSubjectWithGroups(subject);
    } catch (e) {
      throw Exception(e);
    }
  }

  void _setSubjectWithGroups(List<Group> groups) {
    final groupsNotifier = ref.read(groupsProvider.notifier);
    groupsNotifier.onNewSubject(groups);
  }

  // Future<void> getSubjectsWithGroup() async {
  //   // Obtener los grupos del GrupoProvider
  //   final grupos = ref.read(groupsProvider);
  //   List<Subject> materias = [];

  //   // Recorre los grupos
  //   for (var group in grupos) {
  //     // Recorre las materias de cada grupo
  //     for (var materia in group.materias) {
  //       // Cargar las actividades de cada materia
  //       List<Activities> actividades = materia.actividades!.map((actividad) {
  //         return Activities(
  //           nombreActividad: actividad.nombreActividad,
  //           descripcion: actividad.descripcion,
  //           fechaCreacion: actividad.fechaCreacion,
  //         );
  //       }).toList();

  //       materias.add(Subject(
  //         nombreMateria: materia.nombreMateria,
  //         descripcion: materia.descripcion,
  //         codigoColor: materia.codigoColor,
  //         actividades: actividades, // Asignar las actividades a la materia
  //       ));
  //     }
  //   }

  //   // Actualiza el estado con la lista de materias y sus actividades
  //   state = materias;
  // }

  // void _setSubjectWithGroups(List<Group> groups){
  //   state = groups;
  // }

  // void _setCreateSubject(List<Subject> subjects) {
  //   state = subjects;
  // }
}
