import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/activity_state/activity_form_notifier.dart';
import 'package:aprende_mas/providers/activity_state/activity_form_state.dart';

final activityFormProvider =
    StateNotifierProvider.autoDispose<ActivityFormNotifier, ActivityFormState>(
        (ref) {
  return ActivityFormNotifier();
});