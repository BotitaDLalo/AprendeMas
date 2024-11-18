import 'activity.dart';
import 'package:intl/intl.dart';

class ActivityMapper {
  static final DateFormat dateTimeFormat = DateFormat('dd/MM/yyyy HH:mm');

  static Activity fromMap(Map<String, dynamic> map) {
    return Activity(
      docenteId: map['docenteId'] as int,
      nombre: map['nombre'] as String,
      descripcion: map['descripcion'] as String,
      tipoActividadId: map['tipoActividadId'] as int,
      rubricaId: map['rubricaId'] as int,
      fechaCreacion: dateTimeFormat.parse(map['fechaCreacion']),
      fechaLimite: dateTimeFormat.parse(map['fechaLimite']),
      puntuacion: map['puntuacion'] as int,
    );
  }

  static Map<String, dynamic> toMap(Activity activity) {
    return {
      'docenteId': activity.docenteId,
      'nombre': activity.nombre,
      'descripcion': activity.descripcion,
      'tipoActividadId': activity.tipoActividadId,
      'rubricaId': activity.rubricaId,
      'fechaCreacion': dateTimeFormat.format(activity.fechaCreacion),
      'fechaLimite': dateTimeFormat.format(activity.fechaLimite),
      'puntuacion': activity.puntuacion,
    };
  }
}