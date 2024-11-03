import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/subjects/form_subjects_state.dart';
import 'package:aprende_mas/views/infrastructure/inputs.dart';
import 'package:formz/formz.dart';
import '../../views/infrastructure/color_input.dart';

class FormSubjectsStateNotifier extends StateNotifier<FormSubjectsState> {
  // final Function(String, String, Color) createSubjectCallback;
  final Function(String, String, Color, List<int>)
      createSubjectWithGroupsCallback;

  FormSubjectsStateNotifier({required this.createSubjectWithGroupsCallback})
      : super(FormSubjectsState());

  onSubjectNameChanged(String value) {
    final newSubjectName = GenericInput.dirty(value);
    state = state.copyWith(
        subjectName: newSubjectName, isValid: Formz.validate([newSubjectName]));
  }

  onDescriptionChanded(String value) {
    final newDescription = GenericInput.dirty(value);
    state = state.copyWith(
        description: newDescription,
        isValid: Formz.validate([state.subjectName]));
  }

  onGroupsListChanged(int grupoId) {
    List<int> groupsId = state.groupsId;
    groupsId.add(grupoId);
    state = state.copyWith(
        groupsId: groupsId, isValid: Formz.validate([state.subjectName]));
  }
                    //*   1
  onSelectedGroup(int key) {
    state = state.copyWith(isSelectedGroup: {
      ...state.isSelectedGroup,
      key: !(state.isSelectedGroup[key] ?? false)
  //*  1 :        true

    });
  }

//   onColorCodeChanged(Color color) {
//     final newColorCode = ColorInput.dirty(color);
//     state = state.copyWith(
//         subPickerColor: color,
//         colorCode: newColorCode,
//         isValid: Formz.validate([state.subjectName, state.colorCode]));
//  }

  onFormSubmit() async {
    _touchEveryField();
    if (!state.isValid) return;
    state = state.copyWith(isPosting: true);
    await createSubjectWithGroupsCallback(state.subjectName.value,
        state.description.value, state.colorCode.value, state.groupsId);
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
        isValid: Formz.validate([subjectName]));
  }
}
