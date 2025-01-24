import 'package:aprende_mas/models/agenda/event_model.dart';


class EventState {
  final List<Event> events;
  final bool isLoading;
  final String? errorMessage;

  EventState({
    this.events = const [],
    this.isLoading = false,
    this.errorMessage
  });

  EventState copyWith({
    List<Event>? events, 
    bool? isLoading,
    String? errorMessage
  }) {
    return EventState(
      events: events ?? this.events,
      isLoading: isLoading ?? this.isLoading,
      errorMessage:  errorMessage ?? this.errorMessage
    );
  }
}


