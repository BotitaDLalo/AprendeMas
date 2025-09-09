import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/auth_provider.dart';
import 'package:aprende_mas/providers/authentication/forgot_password_form_state.dart';
import 'package:aprende_mas/providers/authentication/forgot_password_form_state_notifier.dart';

final forgotPasswordFormProvider = StateNotifierProvider.autoDispose<
    ForgotPasswordFormStateNotifier, ForgotPasswordFormState>((ref) {

      final forgotPasswordCallback = ref.read(authProvider.notifier).resetPassword;
 
  return ForgotPasswordFormStateNotifier(forgotPasswordCallback: forgotPasswordCallback);
});
