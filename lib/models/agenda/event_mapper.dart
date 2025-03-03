import 'package:aprende_mas/config/utils/general_utils.dart';
import 'package:aprende_mas/models/agenda/event_model.dart';
import 'package:intl/intl.dart';

class EventMapper {
  static final DateFormat dateTimeFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');

  static List<Event> fromMapList(List<Map<String, dynamic>> data) {
    return data.map((map) {
      return Event(
        eventId: map['eventoId'] as int?,
        teacherId: map['docenteId'] as int,
        startDate: formatDate(map['fechaInicio']),
        endDate: formatDate(map['fechaFinal']),
        title: map['titulo'] as String,
        description: map['descripcion'] as String,
        color: map['color'] as String,
        groupIds: (map['grupoId'] as int?) != null ? [map['grupoId'] as int] : [],
        subjectIds: (map['materiaId'] as int?) != null ? [map['materiaId'] as int] : [],
      );
    }).toList();
  }

  static Map<String, dynamic> toMap(Event event) {
    return {
      'eventoId': event.eventId,
      'docenteId': event.teacherId,
      'fechaInicio': formatDate(event.startDate),
      'fechaFinal': formatDate(event.endDate),
      'titulo': event.title,
      'descripcion': event.description,
      'color': event.color,
      'grupoId': event.groupIds?.isNotEmpty == true ? event.groupIds!.first : null, // 🔹 Ajustado
      'materiaId': event.subjectIds?.isNotEmpty == true ? event.subjectIds!.first : null,
    };
  }

  static Event jsonToEntity(Map<String, dynamic> json) {
    print("Datos json: $json");
    return Event(
      eventId: json['eventoId'] as int?,
      teacherId: json['docenteId'] as int,
      startDate: formatDate(json['fechaInicio']),
      endDate: formatDate(json['fechaFinal']),
      title: json['titulo'] as String,
      description: json['descripcion'] as String,
      color: json['color'] as String,
      groupIds: json['grupoId'] != null ? [json['grupoId'] as int] : [],
      subjectIds: json['materiaId'] != null ? [json['materiaId'] as int] : [],
    );
  }
 

  static List<Map<String, dynamic>> toMapList(List<Event> events) {
    return events.map((event) => toMap(event)).toList();
  }
}
