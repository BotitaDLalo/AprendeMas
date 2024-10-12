

import 'package:aprende_mas/models/models.dart';

class LocalActivitiesModel {
  final String nombreActividad;
  final String descripcion;
  final String fechaCreacion;

  LocalActivitiesModel({
    required this.nombreActividad,
    required this.descripcion,
    required this.fechaCreacion,
  });

  // Método para crear desde un JSON
  factory LocalActivitiesModel.fromJson(Map<String, dynamic> json) => LocalActivitiesModel(
    nombreActividad: json['nombreActividad'],
    descripcion: json['descripcion'],
    fechaCreacion: json['fechaCreacion'],
  );

  // Método para transformar en la entidad Actividad
  Activities toEntity() => Activities(
    nombreActividad: nombreActividad,
    descripcion: descripcion,
    fechaCreacion: fechaCreacion, 
  );
}