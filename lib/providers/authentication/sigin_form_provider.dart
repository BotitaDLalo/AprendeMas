import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/auth_provider.dart';
import 'package:aprende_mas/providers/authentication/sigin_form_state.dart';
import 'package:aprende_mas/providers/authentication/sigin_form_state_notifier.dart';

final siginFormProvider =
    StateNotifierProvider.autoDispose<SiginFormStateNotifier, SiginFormState>(
        (ref) {
  final siginUserCallback = ref.read(authProvider.notifier).siginUser;
  return SiginFormStateNotifier(siginUserCallback: siginUserCallback);
});
