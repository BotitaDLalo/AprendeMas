import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/agenda/event_model.dart';
import 'package:aprende_mas/providers/agenda/event_state.dart';
import 'package:aprende_mas/repositories/Interface_repos/agenda/event_repository.dart';

class EventNotifier extends StateNotifier<EventState>{
  final EventRepository eventRepository;

  EventNotifier({required this.eventRepository}) : super(EventState());

  Future<void> getEvents() async {
    try {
      final events = await eventRepository.getEvents();
      _setEvents(events);
      debugPrint("Estado actualizado con eventos: ${state.events}");
    } catch (e) {
      throw Exception(e);
    }
  }

  _setEvents(List<Event> events) {
    state = state.copyWith(events: events);
  }

  // Future<>
}