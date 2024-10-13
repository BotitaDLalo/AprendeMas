import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/models/subjects/mapper_subjects/local_subject_model.dart';

class LocalGroupModel {
  final String nombreGrupo;
  final String? descripcion;
  final String codigoAcceso;
  final String tipoUsuario;
  final String codigoColor;
  final List<LocalSubjectModel> materias;

  LocalGroupModel({
    required this.nombreGrupo,
    this.descripcion,
    required this.codigoAcceso,
    required this.tipoUsuario,
    required this.codigoColor,
    required this.materias,
  });

  // Método para crear desde un JSON
  factory LocalGroupModel.fromJson(Map<String, dynamic> json) => LocalGroupModel(
    nombreGrupo: json['nombrGrupo'],
    descripcion: json['descripcion'],
    codigoAcceso: json['codigoAcceso'],
    tipoUsuario: json['tipoUsuario'],
    codigoColor: json['codigoColor'],
    materias: List<LocalSubjectModel>.from(json['materias'].map((materia) => LocalSubjectModel.fromJson(materia))),
  );

  // Método para transformar en la entidad Grupo
  Group toEntity() => Group(
    nombreGrupo: nombreGrupo,
    descripcion: descripcion,
    codigoAcceso: codigoAcceso,
    tipoUsuario: tipoUsuario,
    codigoColor: codigoColor,
    materias: materias.map((materia) => materia.toEntity()).toList(),
  );
}
