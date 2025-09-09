import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/form_email_state.dart';
import 'package:aprende_mas/views/views.dart';

class FormEmailStateNotifier extends StateNotifier<FormEmailState> {
  final Function(String) verifyEmailSignin;
  FormEmailStateNotifier({required this.verifyEmailSignin})
      : super(FormEmailState());

  onEmailChanged(String value) {
    final newEmail = Email.dirty(value);
    state =
        state.copyWith(email: newEmail, isValid: Formz.validate([newEmail]));
  }

  onVerifyEmailSigninSubmit() async {
    _touchEveryField();
    if (!state.isValid) return;
    state = state.copyWith(isPosting: true);
    bool res = await verifyEmailSignin(state.email.value);
    if (res) {
      state = state.copyWith(isFormPosted: res);
    } else {
      state = state.copyWith(isFormNotPosted: res);
    }
    state = state.copyWith(isPosting: false);

    state = state.copyWith(
        isValid: false, isFormPosted: false, isFormNotPosted: false);
  }

  clearEmailSigninState() {
    state = FormEmailState();
  }

  _touchEveryField() {
    final email = Email.dirty(state.email.value);
    state = state.copyWith(email: email, isValid: Formz.validate([email]));
  }
}
