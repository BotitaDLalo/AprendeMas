import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/form_confirmation_code_state.dart';
import 'package:aprende_mas/providers/authentication/form_confirmation_code_state_notifier.dart';
import 'package:aprende_mas/providers/providers.dart';

final formConfirmationCodeProvider = StateNotifierProvider<
    FormConfirmationCodeStateNotifier, FormConfirmationCodeState>(
  (ref) {
    final verifyConfirmationCodeCallback =
        ref.read(authProvider.notifier).verifyConfirmationCode;
    return FormConfirmationCodeStateNotifier(
        verifyConfirmationCodeCallback: verifyConfirmationCodeCallback);
  },
);
