import 'package:aprende_mas/config/utils/packages.dart';
import 'activity.dart';
import 'package:intl/intl.dart';

class ActivityMapper {
  static final DateFormat dateTimeFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');

  static List<Activity> fromMapList(List<Map<String, dynamic>> data) {
    return data.map((map) {
      return Activity(
        actividadId: map['actividadId'] as int,
        nombreActividad: map['nombreActividad'] as String,
        descripcion: map['descripcionActividad'] as String,
        tipoActividadId: map['tipoActividadId'] as int,
        fechaCreacion: dateTimeFormat.parse(map['fechaCreacionActividad']),
        fechaLimite: dateTimeFormat.parse(map['fechaLimiteActividad']),
        materiaId: map['materiaId'] as int,
      );
    }).toList();
  }

  static Map<String, dynamic> toMap(Activity activity) {
    return {
      'actividadId': activity.actividadId,
      'nombreActividad': activity.nombreActividad,
      'descripcionActividad': activity.descripcion,
      'tipoActividadId': activity.tipoActividadId,
      'fechaCreacionActividad': dateTimeFormat.format(activity.fechaCreacion),
      'fechaLimiteActividad': dateTimeFormat.format(activity.fechaLimite),
      'materiaId': activity.materiaId,
    };
  }
}