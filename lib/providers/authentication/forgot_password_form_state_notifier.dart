import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/forgot_password_form_state.dart';
import 'package:aprende_mas/views/infrastructure/email.dart';
import 'package:formz/formz.dart';

class ForgotPasswordFormStateNotifier
    extends StateNotifier<ForgotPasswordFormState> {
  final TextEditingController emailController;
  final Function(String) forgotPasswordCallback;

  ForgotPasswordFormStateNotifier({required this.forgotPasswordCallback})
      : emailController = TextEditingController(),
        super(ForgotPasswordFormState());

  onEmailChanged(String value) {
    final newEmail = Email.dirty(value);
    state =
        state.copyWith(email: newEmail, isValid: Formz.validate([newEmail]));
  }

   onFormSubmit() async {
    _touchEveryField();
    if (!state.isValid) return;
    final result = await forgotPasswordCallback(state.email.value);
    return result;
  }

  _touchEveryField() {
    final email = Email.dirty(state.email.value);
    state = state.copyWith(
        isFormPosted: true, email: email, isValid: Formz.validate([email]));
  }

  // reseStatetForm(){
  //   emailController.clear();
  //   state = ForgotPasswordFormState();
  // }
}
