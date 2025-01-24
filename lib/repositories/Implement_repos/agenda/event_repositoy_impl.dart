import 'dart:ui';

import 'package:aprende_mas/models/agenda/event_model.dart';
import 'package:aprende_mas/repositories/Implement_repos/agenda/event_data_source_impl.dart';
import 'package:aprende_mas/repositories/Interface_repos/agenda/event_data_source.dart';
import 'package:aprende_mas/repositories/Interface_repos/agenda/event_repository.dart';

class EventRepositoyImpl implements EventRepository{
  final EventDataSource eventDataSource;

  EventRepositoyImpl({EventDataSource? eventDataSource})
    : eventDataSource = eventDataSource ?? EventDataSourceImpl();

  @override
  Future<List<Event>> getEvents() {
    return eventDataSource.getEvents();
  }

  @override
  Future<List<Event>> createEvent(
    String title,
    String description,
    Color color,
    DateTime startDate,
    DateTime endDate,
    int teacherId, {
    List<int>? groupIds,
    List<int>? subjectIds,
  }) {
    // Pasar todos los parámetros, incluyendo los opcionales
    return eventDataSource.createEvent(
      title,
      description,
      color,
      startDate,
      endDate,
      teacherId,
      groupIds: groupIds,
      subjectIds: subjectIds,
    );
  }
  
}