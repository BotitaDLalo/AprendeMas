import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/missing_data_form_state.dart';
import 'package:aprende_mas/views/views.dart';

class MissingDataFormStateNotifier extends StateNotifier<MissingDataFormState> {
  final Function(String, String, String, String) missingDataCallback;

  MissingDataFormStateNotifier({required this.missingDataCallback})
      : super(MissingDataFormState());

  onUsernameChanged(String username) {
    final newUsername = GenericInput.dirty(username);
    state = state.copyWith(
        names: newUsername,
        isValid: Formz.validate([
          state.names,
          state.lastName,
          state.secondLastName,
          state.role,
        ]));
  }

  onLastNameChanged(String lastName) {
    final newLastName = GenericInput.dirty(lastName);
    state = state.copyWith(
        lastName: newLastName,
        isValid: Formz.validate(
            [state.names, state.lastName, state.secondLastName, state.role]));
  }

  onSecondLastNameChanged(String secondLastName) {
    final newSecondLastName = GenericInput.dirty(secondLastName);
    state = state.copyWith(
        secondLastName: newSecondLastName,
        isValid: Formz.validate(
            [state.names, state.lastName, state.secondLastName, state.role]));
  }

  onRoleChanged(String role) {
    final newRole = Role.dirty(role);
    state = state.copyWith(
        role: newRole,
        isValid: Formz.validate(
            [state.names, state.lastName, state.secondLastName, state.role]));
  }

  onFormSubmit() async {
    _touchEveryField();
    if (!state.isValid) return;
    state = state.copyWith(isPosting: true);
    bool res = await missingDataCallback(state.names.value,
        state.lastName.value, state.secondLastName.value, state.role.value);
    if (res) {
      state = state.copyWith(isFormPosted: true, isPosting: false);
    } else {
      state = state.copyWith(isFormNotPosted: true, isPosting: false);
    }

    //* Reiniciamos el estado
    state = state.copyWith(
        isValid: false, isFormPosted: false, isFormNotPosted: false);
  }

  _touchEveryField() {
    final names = GenericInput.dirty(state.names.value);
    final lastName = GenericInput.dirty(state.lastName.value);
    final secondLastName = GenericInput.dirty(state.secondLastName.value);
    final role = Role.dirty(state.role.value);

    state = state.copyWith(
        names: names,
        role: role,
        isValid: Formz.validate([names, lastName, secondLastName, role]));
  }
}
