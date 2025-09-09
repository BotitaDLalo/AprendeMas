import 'package:aprende_mas/config/utils/general_utils.dart';
import 'package:aprende_mas/models/agenda/event_model.dart';
import 'package:intl/intl.dart';

class EventMapper {
  static final DateFormat dateTimeFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');

  static List<Event> fromMapList(List<Map<String, dynamic>> data) {
    return data.map((map) {
      return Event(
        eventId: map['EventoId'] as int?,
        teacherId: map['DocenteId'] as int,
        startDate: formatDate(map['FechaInicio']),
        endDate: formatDate(map['FechaFinal']),
        title: map['Titulo'] as String,
        description: map['Descripcion'] as String,
        color: map['Color'] as String,
        groupIds:
            (map['GrupoId'] as int?) != null ? [map['GrupoId'] as int] : [],
        subjectIds:
            (map['MateriaId'] as int?) != null ? [map['MateriaId'] as int] : [],
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
      'grupoId': event.groupIds?.isNotEmpty == true
          ? event.groupIds!.first
          : null, // 🔹 Ajustado
      'materiaId':
          event.subjectIds?.isNotEmpty == true ? event.subjectIds!.first : null,
    };
  }

  static Event jsonToEntity(Map<String, dynamic> json) {
    print("Datos json: $json");
    return Event(
      eventId: json['EventoId'] as int?,
      teacherId: json['DocenteId'] as int,
      startDate: formatDate(json['FechaInicio']),
      endDate: formatDate(json['FechaFinal']),
      title: json['Titulo'] as String,
      description: json['Descripcion'] as String,
      color: json['Color'] as String,
      groupIds: json['GrupoId'] != null ? [json['GrupoId'] as int] : [],
      subjectIds: json['MateriaId'] != null ? [json['MateriaId'] as int] : [],
    );
  }

  static List<Map<String, dynamic>> toMapList(List<Event> events) {
    return events.map((event) => toMap(event)).toList();
  }
}
