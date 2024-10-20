import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/groups/form_groups_state.dart';
import 'package:aprende_mas/views/infrastructure/color_input.dart';
import 'package:aprende_mas/views/infrastructure/inputs.dart';
import 'package:formz/formz.dart';

class FormGroupsStateNotifier extends StateNotifier<FormGroupsState> {
  final Function(String, String, Color) createGroupCallback;

  FormGroupsStateNotifier({required this.createGroupCallback})
      : super(FormGroupsState());

  //TODO: colocar los cambios de estado en los campos del formulario

  onGroupNameChanged(String value) {
    final newGroupName = GenericInput.dirty(value);
    state = state.copyWith(
        groupName: newGroupName,
        isValid: Formz.validate([newGroupName, state.colorCode]));
  }

  onDescriptionChanged(String value) {
    final newDescription = GenericInput.dirty(value);
    state = state.copyWith(
        description: newDescription,
        isValid: Formz.validate([state.groupName, state.colorCode]));
  }

  onColorCodeChanged(Color color) {
    final newColorCode = ColorInput.dirty(color);
    state = state.copyWith(
        pickerColor: color,
        colorCode: newColorCode,
        isValid: Formz.validate([state.groupName, state.colorCode]));
  }


  onFormSubmit() async {
    _touchEveryField();
    if (!state.isValid) return;
    state = state.copyWith(isPosting: true);
    await createGroupCallback(
        state.groupName.value, state.description.value, state.colorCode.value);
    state = state.copyWith(isPosting: false);
  }

  _touchEveryField() {
    final groupName = GenericInput.dirty(state.groupName.value);
    final description = GenericInput.dirty(state.description.value);
    final colorCode = ColorInput.dirty(state.colorCode.value);

    state = state.copyWith(
        isFormPosted: true,
        groupName: groupName,
        description: description,
        colorCode: colorCode,
        isValid: Formz.validate([groupName, colorCode]));
  }
}
