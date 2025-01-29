import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/agenda/event_provider.dart';
import 'package:aprende_mas/providers/agenda/form_event_notifier.dart';
import 'package:aprende_mas/providers/agenda/form_event_state.dart';

final formEventProvider = 
  StateNotifierProvider.autoDispose<FormEventNotifier, FormEventState>(
    (ref) {
      final createEvent = ref.read(eventProvider.notifier).createEvents;

      return FormEventNotifier(eventCallback: createEvent);
    }
  );