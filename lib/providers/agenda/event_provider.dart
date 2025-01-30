import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/agenda/event_state.dart';
import 'package:aprende_mas/providers/agenda/event_state_notifier.dart';
import 'package:aprende_mas/repositories/Implement_repos/agenda/event_repositoy_impl.dart';

final eventRepositoryProvider = Provider<EventRepositoyImpl>((ref) {
  return EventRepositoyImpl();
});

final eventProvider = StateNotifierProvider<EventNotifier, EventState>((ref) {
  final repository = ref.watch(eventRepositoryProvider);
  return EventNotifier(eventRepository: repository);
});
