import 'activity.dart';
import 'package:intl/intl.dart';
import 'package:aprende_mas/config/utils/general_utils.dart';

class ActivityMapper {
  static final DateFormat dateTimeFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');

  static List<Activity> fromMapList(List<Map<String, dynamic>> data) {
    return data.map((map) {
      return Activity(
          activityId: map['actividadId'] as int,
          nombreActividad: map['nombreActividad'] as String,
          descripcion: map['descripcionActividad'] as String,
          tipoActividadId: map['tipoActividadId'] as int,
          fechaCreacion: formatDate(map['fechaCreacionActividad']),
          fechaLimite: formatDate(map['fechaLimiteActividad']),
          materiaId: map['materiaId'] as int,
          puntaje: map['puntaje'] as int);
    }).toList();
  }

  static Map<String, dynamic> toMap(Activity activity) {
    return {
      'actividadId': activity.activityId,
      'nombreActividad': activity.nombreActividad,
      'descripcionActividad': activity.descripcion,
      'tipoActividadId': activity.tipoActividadId,
      'fechaCreacionActividad': formatDate(activity.fechaCreacion),
      'fechaLimiteActividad': formatDate(activity.fechaLimite),
      'materiaId': activity.materiaId,
      'puntaje': activity.puntaje
    };
  }
}
