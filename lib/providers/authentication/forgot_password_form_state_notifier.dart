import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/forgot_password_form_state.dart';
import 'package:aprende_mas/views/infrastructure/email.dart';
import 'package:formz/formz.dart';

class ForgotPasswordFormStateNotifier
    extends StateNotifier<ForgotPasswordFormState> {
  final TextEditingController emailController;

  ForgotPasswordFormStateNotifier(super.state):emailController=TextEditingController();



  onEmailChanged(String value) {
    final newEmail = Email.dirty(value);
    state =
        state.copyWith(email: newEmail, isValid: Formz.validate([newEmail]));
  }

  onFormSubmit() async {
    _touchEveryField();
    if (!state.isValid) return;
    //TODO: Logica para envio de correo de recuperacion de contra
    print("Correo enviar");
  }

  _touchEveryField() {
    final email = Email.dirty(state.email.value);

    state = state.copyWith(
        isFormPosted: true, email: email, isValid: Formz.validate([email]));
  }
}
