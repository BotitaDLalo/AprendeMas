import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/missing_data_form_state.dart';
import 'package:aprende_mas/providers/authentication/missing_data_form_state_notifier.dart';
import 'package:aprende_mas/providers/providers.dart';

final missingDataFormProvider =
    StateNotifierProvider<MissingDataFormStateNotifier, MissingDataFormState>(
        (ref) {
  final missingDataCallback =
      ref.read(authProvider.notifier).missingDataGoogleUser;

  return MissingDataFormStateNotifier(missingDataCallback: missingDataCallback);
});
