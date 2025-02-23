import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/agenda/event_model.dart';

abstract class EventRepository {
  Future<List<Event>> getEvents();

  Future<List<Event>> createEvent(
    String title,
    String description,
    Color color,
    DateTime startDate,
    DateTime endDate,
    {List<int>? groupIds,
    List<int>? subjectIds,}
  );

  Future<List<Event>> updateEvent(
    String title,
    String description,
    Color color,
    DateTime startDate,
    DateTime endDate,
    {List<int>? groupIds,
    List<int>? subjectIds,}
  );  


  Future<List<Event>> deleteEvent(int teacherId, int eventId);
}