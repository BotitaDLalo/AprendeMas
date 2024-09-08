import 'package:aprende_mas/models/authentication/login_form_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginFormStateNotifier extends StateNotifier<LoginFormState> {
  LoginFormStateNotifier() : super(LoginFormState(email: '', password: ''));

  void writeEmail(String email) {
    state = state.copyWith(email: email);
  }

  void writePassword(String password) {
    state = state.copyWith(password: password);
  }
}
