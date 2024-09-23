import 'package:aprende_mas/providers/authentication/auth_state.dart';
import 'package:aprende_mas/providers/authentication/auth_state_notifier.dart';
import 'package:flutter/material.dart';

class RouterNotifier extends ChangeNotifier {
  final AuthStateNotifier _authStateNotifier;

  AuthStatus _authStatus = AuthStatus.checking;

  RouterNotifier(this._authStateNotifier) {
    _authStateNotifier.addListener((state) {
      authStatus = state.authStatus;
    });
  }

  AuthStatus get authStatus => _authStatus;

  set authStatus(AuthStatus value) {
    _authStatus = value;
    notifyListeners();
  }
}
