import 'package:aprende_mas/models/agenda/event_model.dart';


class EventState {
  final List<Event> events;
  final Event? event;
  final bool isLoading;
  final String? errorMessage;

  EventState({
    this.events = const [],
    this.event,
    this.isLoading = false,
    this.errorMessage
  });

  EventState copyWith({
    List<Event>? events, 
    Event? event,
    bool? isLoading,
    String? errorMessage
  }) {
    return EventState(
      events: events ?? this.events,
      event: event ?? this.event,
      isLoading: isLoading ?? this.isLoading,
      errorMessage:  errorMessage ?? this.errorMessage
    );
  }
}


