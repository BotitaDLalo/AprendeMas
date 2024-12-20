import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/subjects/form_subjects_state.dart';
import 'package:aprende_mas/views/widgets/inputs/inputs.dart';
import '../../views/widgets/inputs/color_input.dart';

class FormSubjectsStateNotifier extends StateNotifier<FormSubjectsState> {
  final Function(String, String, Color, List<int>)
      createSubjectWithGroupsCallback;

  final Function(String, String, Color) createSubjectWithoutGroup;

  FormSubjectsStateNotifier(
      {required this.createSubjectWithGroupsCallback,
      required this.createSubjectWithoutGroup})
      : super(FormSubjectsState());

  onSubjectNameChanged(String value) {
    final newSubjectName = GenericInput.dirty(value);
    state = state.copyWith(
        subjectName: newSubjectName, isValid: Formz.validate([newSubjectName]));
  }

  onDescriptionChanded(String value) {
    final newDescription = GenericInput.dirty(value);
    state = state.copyWith(
        subjectDescription: newDescription,
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
    List<int> lsGroupsId = List.from(state.groupsId);

    state = state.copyWith(isSelectedGroup: {
      ...state.isSelectedGroup,
      key: !(state.isSelectedGroup[key] ?? false)
      //*  1 :        true
    });
    if (state.isSelectedGroup[key] == true) {
      lsGroupsId.add(key);
    } else {
      lsGroupsId.remove(key);
    }
    state = state.copyWith(groupsId: lsGroupsId);
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
    if (state.groupsId.isNotEmpty) {
      await createSubjectWithGroupsCallback(
          state.subjectName.value,
          state.subjectDescription.value,
          state.colorCode.value,
          state.groupsId);
    } else {
      await createSubjectWithoutGroup(state.subjectName.value,
          state.subjectDescription.value, state.colorCode.value);
    }
    state = state.copyWith(isPosting: false);
    resetFormSubjects();
  }

  void resetFormSubjects() {
    const resetFormSubjects = GenericInput.pure();
    state = state.copyWith(
        subjectName: resetFormSubjects,
        subjectDescription: resetFormSubjects,
        groupsId: [],
        isValid: false);
  }

  _touchEveryField() {
    final subjectName = GenericInput.dirty(state.subjectName.value);

    final description = GenericInput.dirty(state.subjectDescription.value);

    final colorCode = ColorInput.dirty(state.colorCode.value);

    state = state.copyWith(
        isFormPosted: true,
        subjectName: subjectName,
        subjectDescription: description,
        colorCode: colorCode,
        isValid: Formz.validate([subjectName]));
  }
}
