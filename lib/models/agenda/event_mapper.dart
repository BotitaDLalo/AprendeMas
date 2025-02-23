import 'package:aprende_mas/models/agenda/event_model.dart';
import 'package:intl/intl.dart';

class EventMapper {
  static final DateFormat dateTimeFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');

  static List<Event> fromMapList(List<Map<String, dynamic>> data) {
    return data.map((map) {
      return Event(
        eventId: map['eventoId'] as int?,
        teacherId: map['docenteId'] as int,
        startDate: dateTimeFormat.parse(map['fechaInicio']),
        endDate: dateTimeFormat.parse(map['fechaFinal']),
        title: map['titulo'] as String,
        description: map['descripcion'] as String,
        color: map['color'] as String,
        groupIds: map['grupoId'] != null ? [map['grupoId'] as int] : [], // 🔹 Se obtiene directamente
        subjectIds: map['materiaId'] != null ? [map['materiaId'] as int] : [],
      );
    }).toList();
  }

  static Map<String, dynamic> toMap(Event event) {
    return {
      'eventoId': event.eventId,
      'docenteId': event.teacherId,
      'fechaInicio': dateTimeFormat.format(event.startDate),
      'fechaFinal': dateTimeFormat.format(event.endDate),
      'titulo': event.title,
      'descripcion': event.description,
      'color': event.color,
      'grupoId': event.groupIds?.isNotEmpty == true ? event.groupIds!.first : null, // 🔹 Ajustado
      'materiaId': event.subjectIds?.isNotEmpty == true ? event.subjectIds!.first : null,
    };
  }

  static List<Map<String, dynamic>> toMapList(List<Event> events) {
    return events.map((event) => toMap(event)).toList();
  }
}
