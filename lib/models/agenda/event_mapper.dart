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
        groupIds: map['eventosGrupos'] != null
            ? List<int>.from(map['eventosGrupos'].map((g) => g['grupoId'] as int))
            : null,
        subjectIds: map['eventosMaterias'] != null
            ? List<int>.from(map['eventosMaterias'].map((m) => m['materiaId'] as int))
            : null,
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
      'eventosGrupos': event.groupIds?.map((id) => {'grupoId': id}).toList(),
      'eventosMaterias': event.subjectIds?.map((id) => {'materiaId': id}).toList(),
    };
  }

  /// Convierte una lista de eventos a una lista de mapas para enviar al backend.
  static List<Map<String, dynamic>> toMapList(List<Event> events) {
    return events.map((event) => toMap(event)).toList();
  }
}

