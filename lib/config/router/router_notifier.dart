import 'package:aprende_mas/providers/authentication/auth_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:aprende_mas/config/utils/catalog_names.dart';

class RouterNotifier extends ChangeNotifier {
  final AuthStateNotifier _authStateNotifier;

  AuthStatus _authStatus = AuthStatus.checking;
  AuthGoogleStatus _authGoogleStatus = AuthGoogleStatus.checking;

  RouterNotifier(this._authStateNotifier) {
    _authStateNotifier.addListener((state) {
      authStatus = state.authStatus!;
      authGoogleStatus = state.authGoogleStatus!;
    });
  }

  AuthStatus get authStatus => _authStatus;
  AuthGoogleStatus get authGoogleStatus => _authGoogleStatus;

  set authStatus(AuthStatus value) {
    _authStatus = value;
    notifyListeners();
  }

  set authGoogleStatus(AuthGoogleStatus value) {
    _authGoogleStatus = value;
    notifyListeners();
  }
}
