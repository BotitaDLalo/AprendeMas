import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'login_form_state_notifier.dart';
import 'login_form_state.dart';


final loginFormProvider =
    StateNotifierProvider.autoDispose<LoginFormNotifier, LoginFormState>((ref) {
  return LoginFormNotifier();
});