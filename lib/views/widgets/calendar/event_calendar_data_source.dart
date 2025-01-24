import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/agenda/event_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventCalendarDataSource extends CalendarDataSource {
  EventCalendarDataSource(List<Event> events) {
    appointments = events;
  }

  // Método para convertir un String hexadecimal en un Color.
  Color stringToColor(String hexColor) {
    try {
      return Color(int.parse("0xFF$hexColor"));
    } catch (e) {
      debugPrint("Error al convertir el color: $e");
      return Colors.grey; // Color predeterminado en caso de error.
    }
  }

  @override
  Color getColor(int index) {
    // Convierte el color de String a Color.
    final eventColor = (appointments![index] as Event).color;
    return stringToColor(eventColor);
      // Devuelve el color directamente si ya es un objeto Color.
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].startDate;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].endDate;
  }

  @override
  String getSubject(int index) {
    return appointments![index].title;
  }
}
