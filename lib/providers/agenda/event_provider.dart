import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/agenda/event_state.dart';
import 'package:aprende_mas/providers/agenda/event_state_notifier.dart';
import 'package:aprende_mas/repositories/Implement_repos/agenda/event_repositoy_impl.dart';
import 'package:aprende_mas/views/widgets/calendar/event_calendar_data_source.dart';

final eventRepositoryProvider = Provider<EventRepositoyImpl>((ref) {
  return EventRepositoyImpl();
});

final calendarDataSourceProvider = Provider<EventCalendarDataSource>((ref) {
  return EventCalendarDataSource([]);
});


final eventProvider = StateNotifierProvider<EventNotifier, EventState>((ref) {
  final repository = ref.watch(eventRepositoryProvider);
  final calendarDataSource = ref.watch(calendarDataSourceProvider);
  return EventNotifier( eventRepository: repository, calendarDataSource: calendarDataSource);
});
