import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/form_email_state.dart';
import 'package:aprende_mas/providers/authentication/form_email_state_notifier.dart';
import 'package:aprende_mas/providers/providers.dart';

final formEmailProvider =
    StateNotifierProvider<FormEmailStateNotifier, FormEmailState>(
  (ref) {
    final verifyEmailSigninCallback =
        ref.read(authProvider.notifier).verifyEmailSignin;
    return FormEmailStateNotifier(verifyEmailSignin: verifyEmailSigninCallback);
  },
);
