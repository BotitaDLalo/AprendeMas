import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/form_confirmation_code_state.dart';
import 'package:aprende_mas/views/views.dart';

class FormConfirmationCodeStateNotifier
    extends StateNotifier<FormConfirmationCodeState> {
  final Function(String) verifyConfirmationCodeCallback;
  FormConfirmationCodeStateNotifier(
      {required this.verifyConfirmationCodeCallback})
      : super(FormConfirmationCodeState());

  oncodeField1Changed(String value) {
    final codeField1 = GenericInput.dirty(value);
    state = state.copyWith(
        codeField1: codeField1,
        isValid: Formz.validate([
          codeField1,
          state.codeField2,
          state.codeField3,
          state.codeField4,
          state.codeField5
        ]));
  }

  oncodeField2Changed(String value) {
    final codeField2 = GenericInput.dirty(value);
    state = state.copyWith(
        codeField2: codeField2,
        isValid: Formz.validate([
          state.codeField1,
          codeField2,
          state.codeField3,
          state.codeField4,
          state.codeField5
        ]));
  }

  oncodeField3Changed(String value) {
    final codeField3 = GenericInput.dirty(value);
    state = state.copyWith(
        codeField3: codeField3,
        isValid: Formz.validate([
          state.codeField1,
          state.codeField2,
          codeField3,
          state.codeField4,
          state.codeField5
        ]));
  }

  oncodeField4Changed(String value) {
    final codeField4 = GenericInput.dirty(value);
    state = state.copyWith(
        codeField4: codeField4,
        isValid: Formz.validate([
          state.codeField1,
          state.codeField2,
          state.codeField3,
          codeField4,
          state.codeField5
        ]));
  }

  oncodeField5Changed(String value) {
    final codeField5 = GenericInput.dirty(value);
    state = state.copyWith(
        codeField5: codeField5,
        isValid: Formz.validate([
          state.codeField1,
          state.codeField2,
          state.codeField3,
          state.codeField4,
          codeField5
        ]));
  }

  onVerifyCodeSubmit() async {
    _touchEveryField();
    if (!state.isValid) return;
    state = state.copyWith(isPosting: true);

    List<String> lsCodeFields = [
      state.codeField1.value,
      state.codeField2.value,
      state.codeField3.value,
      state.codeField4.value,
      state.codeField5.value
    ];
    await verifyConfirmationCodeCallback(lsCodeFields.join());
    state = state.copyWith(isPosting: false);
  }

  _touchEveryField() {
    final codeField1 = GenericInput.dirty(state.codeField1.value);
    final codeField2 = GenericInput.dirty(state.codeField2.value);
    final codeField3 = GenericInput.dirty(state.codeField3.value);
    final codeField4 = GenericInput.dirty(state.codeField4.value);
    final codeField5 = GenericInput.dirty(state.codeField5.value);

    state = state.copyWith(
        codeField1: codeField1,
        codeField2: codeField2,
        codeField3: codeField3,
        codeField4: codeField4,
        codeField5: codeField5,
        isValid: Formz.validate(
            [codeField1, codeField2, codeField3, codeField4, codeField5]));
  }
}
