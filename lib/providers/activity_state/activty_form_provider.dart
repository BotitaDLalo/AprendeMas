import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/activity_state/activity_form_notifier.dart';
import 'package:aprende_mas/providers/activity_state/activity_form_state.dart';
import 'package:aprende_mas/providers/activity_state/activity_provider.dart';

final activityFormProvider =
    StateNotifierProvider.autoDispose<ActivityFormNotifier, ActivityFormState>(
  (ref) {
    // Cambiamos a activityProvider.notifier
  final createActivity = ref.read(activityProvider.notifier).createdActivity;

    return ActivityFormNotifier(activityCallback: createActivity);
  },
);
