import 'package:aprende_mas/models/activities/activities_mapper/local_activities_model.dart';
import 'package:aprende_mas/models/models.dart';

class LocalSubjectModel {
  final String nombreMateria;
  final String descripcion;
  final String codigoColor;
  final List<LocalActivitiesModel>? actividades;

  LocalSubjectModel({
    required this.nombreMateria,
    required this.descripcion,
    required this.codigoColor,
    this.actividades,
  });

  // Método para crear desde un JSON
  factory LocalSubjectModel.fromJson(Map<String, dynamic> json) =>
      LocalSubjectModel(
        nombreMateria: json['nombreMateria'],
        descripcion: json['descripcion'],
        codigoColor: json['codigoColor'],
        actividades: json['actividades'] != null
            ? List<LocalActivitiesModel>.from(json['actividades']
                .map((actividad) => LocalActivitiesModel.fromJson(actividad)))
            : null,
      );

  // Método para transformar en la entidad Materia
  Subject toEntity() => Subject(
        nombreMateria: nombreMateria,
        descripcion: descripcion,
        codigoColor: codigoColor,
        actividades:
            actividades!.map((actividad) => actividad.toEntity()).toList(), 
      );
}