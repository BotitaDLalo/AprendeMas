import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/group_subjects/form_groups_subjects_state.dart';
import 'package:aprende_mas/views/widgets/inputs/inputs.dart';

class FormStudentJoinClassStateNotifier
    extends StateNotifier<FormGroupsSubjectsState> {
  Function(String) joinClassCallback;
  FormStudentJoinClassStateNotifier({required this.joinClassCallback})
      : super(FormGroupsSubjectsState());

  onCodeInputChange(String value) {
    final codeClass = GenericInput.dirty(value);
    state = state.copyWith(
        codeClass: codeClass, isValid: Formz.validate([state.codeClass]));
  }

  onFormSubmit() async {
    _touchField();
    if (!state.isValid) return;
    state = state.copyWith(isPosting: true);

    bool res = await joinClassCallback(state.codeClass.value);
    state = state.copyWith(isFormPosted: res, isPosting: false);

    state = state.copyWith(isValid: false, isFormPosted: false);
  }

  _touchField() {
    final codeClass = GenericInput.dirty(state.codeClass.value);
    state = state.copyWith(
        codeClass: codeClass, isValid: Formz.validate([codeClass]));
  }
}
