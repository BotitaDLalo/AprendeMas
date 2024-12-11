import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/groups/form_groups_state.dart';
import 'package:aprende_mas/views/inputs/color_input.dart';
import 'package:aprende_mas/views/inputs/inputs.dart';
import '../../models/models.dart';

class FormGroupsStateNotifier extends StateNotifier<FormGroupsState> {
  // final Function(String, String, Color) createGroupCallback;
  final Function(String, String, Color, List<SubjectsRow>)
      createGroupSubjectsCallback;

  FormGroupsStateNotifier({required this.createGroupSubjectsCallback})
      : super(FormGroupsState());

//#FORMULARIO PARA CREACION DE UN GRUPO
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
    if (state.subjectsRow.isNotEmpty) {
      await createGroupSubjectsCallback(state.groupName.value,
          state.description.value, state.colorCode.value, state.subjectsRow);
    }
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

//#FORMULARIO PARA CREAR UNA MATERIA  DENTRO DEL FORMULARIO DE CREACION DE UN GRUPO
  onSubjectNameChanged(String value) {
    final newSubjectName = GenericInput.dirty(value);
    state = state.copyWith(
        subjectName: newSubjectName,
        isValid: Formz.validate([state.subjectName]));
  }

  onSubjectDescription(String value) {
    final newSubjectDescription = GenericInput.dirty(value);
    state = state.copyWith(subjectDescription: newSubjectDescription);
  }

  onSubjectSubmit() {
    _subjectTouchEveryField();
    if (!state.isValid) return;
    final newSubject = SubjectsRow(
        nombreMateria: state.subjectName.value,
        descripcion: state.subjectDescription.value);
    state = state.copyWith(subjectsRow: [newSubject, ...state.subjectsRow]);
    resetFormSubjects();
  }

  void resetFormSubjects() {
    const resetFormSubjects = GenericInput.pure();
    state = state.copyWith(
        subjectName: resetFormSubjects,
        subjectDescription: resetFormSubjects,
        isValid: false);
  }

  _subjectTouchEveryField() {
    final subjectName = GenericInput.dirty(state.subjectName.value);
    final subjectDescription =
        GenericInput.dirty(state.subjectDescription.value);

    state = state.copyWith(
        isFormPosted: true,
        subjectName: subjectName,
        subjectDescription: subjectDescription);
  }

  //# FORMULARIO PARA ACTUALIZAR UNA MATERIA CREADA DENTRO DEL FORMULARIO DE CREACION DE UN GRUPO
  onUpdateIndexSubjChanged(int value) {
    state = state.copyWith(subjectIndex: value);
  }

  onUpdateSubjNameChanged(String value) {
    final newSubjectName = GenericInput.dirty(value);
    state = state.copyWith(subjectName: newSubjectName);
  }

  onUpdateSubjDescriptionChanged(String value) {
    final newDescriptionName = GenericInput.dirty(value);
    state = state.copyWith(subjectDescription: newDescriptionName);
  }

  onUpdateSubjectsSubmit() {
    List<SubjectsRow> subjectsList = List.from(state.subjectsRow);
    final indexSubject = state.subjectIndex;
    final newSubjectName = state.subjectName.value;
    final newSubjectDescription = state.subjectDescription.value;

    subjectsList[indexSubject] = SubjectsRow(
        nombreMateria: newSubjectName, descripcion: newSubjectDescription);
  }
}
