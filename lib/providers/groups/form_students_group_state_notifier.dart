import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/various/verify_email.dart';
import 'package:aprende_mas/providers/groups/form_groups_state.dart';

class FormStudentsGroupStateNotifier extends StateNotifier<FormGroupsState> {
  final Function(String) verifyEmailCallback;
  final Function(int) addStudentsGroupCallback;

  FormStudentsGroupStateNotifier(
      {required this.verifyEmailCallback,
      required this.addStudentsGroupCallback})
      : super(FormGroupsState());

  //# Verificar email
  Future<void> onVerifyEmailSubmit(String email) async {
    state = state.copyWith(isPosting: true);
    VerifyEmail e = await verifyEmailCallback(email);

    _setVerifyEmail(e);
    state = state.copyWith(isPosting: false);
  }

  _setVerifyEmail(VerifyEmail verifyEmail) {
    state = state.copyWith(verifyEmail: verifyEmail);
  }

  //#Agregar alumnos a grupo

  onAddStudentsGroup(int groupId) async {
    state = state.copyWith(isPosting: true);
    bool res = await addStudentsGroupCallback(groupId);
    if (res) {
      state = state.copyWith(isFormPosted: res);
    }
    state = state.copyWith(isPosting: false);
  }
}
