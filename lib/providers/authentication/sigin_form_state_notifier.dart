import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/sigin_form_state.dart';
import 'package:aprende_mas/views/infrastructure/generic_input.dart';
import 'package:aprende_mas/views/infrastructure/role.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:formz/formz.dart';

class SiginFormStateNotifier extends StateNotifier<SiginFormState> {
  final Function(String, String, String, String) siginUserCallback;

  SiginFormStateNotifier({required this.siginUserCallback})
      : super(SiginFormState());

  onNameChanged(String value) {
    final newName = GenericInput.dirty(value);
    state = state.copyWith(
        name: newName,
        isValid:
            Formz.validate([newName, state.email, state.password, state.role]));
  }

  onEmailChanged(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
        email: newEmail,
        isValid:
            Formz.validate([state.name, newEmail, state.password, state.role]));
  }

  onPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
        password: newPassword,
        isValid:
            Formz.validate([state.name, state.email, newPassword, state.role]));
  }

  onRoleChanged(String value) {
    final newRole = Role.dirty(value);
    state = state.copyWith(
        role: newRole,
        isValid:
            Formz.validate([state.name, state.email, state.password, newRole]));
  }

  onFormSubmit() async {
    _touchEveryField();
    if (!state.isValid) return;
    final result = await siginUserCallback(state.name.value, state.email.value,
        state.password.value, state.role.value);

    return result;
  }

  _touchEveryField() {
    final name = GenericInput.dirty(state.name.value);
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    final role = Role.dirty(state.role.value);

    state = state.copyWith(
        isFormPosted: true,
        name: name,
        email: email,
        password: password,
        role: role,
        isValid: Formz.validate([name, email, password, role]));
  }
}
