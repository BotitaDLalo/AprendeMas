import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/agenda/event_model.dart';
import 'package:aprende_mas/providers/agenda/event_provider.dart';
import 'package:aprende_mas/providers/agenda/form_event_state.dart';
import 'package:aprende_mas/providers/agenda/form_update_event_notifier.dart';

final formUpdateEventProvider = 
  StateNotifierProvider.autoDispose.family<FormUpdateEventNotifier, FormEventState, Event>(
    (ref, event) {
      final updateEvent = ref.watch(eventProvider.notifier).updateEvents;

      return FormUpdateEventNotifier(updateEventCallback: updateEvent, event: event);
    }
  );