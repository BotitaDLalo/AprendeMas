import 'package:aprende_mas/models/activities/activities_mapper/local_activities_model.dart';
import 'package:aprende_mas/models/models.dart';

class LocalSubjectModel {
  final String nombreMateria;
  final String descripcion;
  final List<LocalActivitiesModel>? actividades;

  LocalSubjectModel({
    required this.nombreMateria,
    required this.descripcion,
    this.actividades,
  });

  // Método para crear desde un JSON
  factory LocalSubjectModel.fromJson(Map<String, dynamic> json) =>
      LocalSubjectModel(
        nombreMateria: json['nombreMateria'],
        descripcion: json['descripcion'],
        actividades: json['actividades'] != null
            ? List<LocalActivitiesModel>.from(json['actividades']
                .map((actividad) => LocalActivitiesModel.fromJson(actividad)))
            : null,
      );

  // Método para transformar en la entidad Materia
  Subject toEntity() => Subject(
        nombreMateria: nombreMateria,
        descripcion: descripcion,
        actividades:
            actividades!.map((actividad) => actividad.toEntity()).toList(), 
      );
}