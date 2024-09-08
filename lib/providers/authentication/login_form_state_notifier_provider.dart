import 'package:aprende_mas/models/authentication/login_form_state.dart';
import 'package:aprende_mas/providers/authentication/login_form_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginFormStateNotifierProvider =
    StateNotifierProvider<LoginFormStateNotifier, LoginFormState>(
  (ref) => LoginFormStateNotifier(),
);
