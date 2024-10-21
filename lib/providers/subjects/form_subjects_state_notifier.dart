import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/subjects/form_subjects_state.dart';
import 'package:aprende_mas/views/infrastructure/inputs.dart';
import 'package:formz/formz.dart';

import '../../views/infrastructure/color_input.dart';

class FormSubjectsStateNotifier extends StateNotifier<FormSubjectsState> {
  final Function(String, String, Color) createSubjectCallback;

  FormSubjectsStateNotifier({required this.createSubjectCallback})
      : super(FormSubjectsState());

  onSubjectNameChanged(String value) {
    final newSubjectName = GenericInput.dirty(value);
    state = state.copyWith(
        subjectName: newSubjectName,
        isValid: Formz.validate([newSubjectName, state.colorCode]));
  }

  onDescriptionChanded(String value) {
    final newDescription = GenericInput.dirty(value);
    state = state.copyWith(
        description: newDescription,
        isValid: Formz.validate([state.subjectName, state.colorCode]));
  }

  onColorCodeChanged(Color color) {
    final newColorCode = ColorInput.dirty(color);
    state = state.copyWith(
        subPickerColor: color,
        colorCode: newColorCode,
        isValid: Formz.validate([state.subjectName, state.colorCode]));
 }

  onFormSubmit() async {
    _touchEveryField();
    if (!state.isValid) return;
    state = state.copyWith(isPosting: true);
    await createSubjectCallback(state.subjectName.value,
        state.description.value, state.colorCode.value);
    state = state.copyWith(isPosting: false);
  }

  _touchEveryField() {
    final subjectName = GenericInput.dirty(state.subjectName.value);

    final description = GenericInput.dirty(state.description.value);

    final colorCode = ColorInput.dirty(state.colorCode.value);

    state = state.copyWith(
        isFormPosted: true,
        subjectName: subjectName,
        description: description,
        colorCode: colorCode,
        isValid: Formz.validate([subjectName, colorCode]));
  }
}
