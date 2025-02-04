import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_provider.dart';
import 'login_form_state_notifier.dart';
import 'login_form_state.dart';

final loginFormProvider = StateNotifierProvider.autoDispose<LoginFormNotifier, LoginFormState>((ref) {
  final loginUserCallback = ref.read(authProvider.notifier).loginUser;
  final loginUserGoogleCallback = ref.read(authProvider.notifier).loginGoogleUser;
  
  return LoginFormNotifier(
    loginUserCallback: loginUserCallback,
    loginUserGoogleCallback: loginUserGoogleCallback
  );
});
