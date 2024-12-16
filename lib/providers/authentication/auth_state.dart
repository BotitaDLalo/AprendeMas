import 'package:aprende_mas/models/models.dart';

enum AuthStatus { checking, authenticated, notAuthenticated}

enum AuthGoogleStatus { checking, authenticated, notAuthenticated}

enum RegisterStatus { registered, notRegistered }


class AuthState {
  final AuthStatus? authStatus;
  final RegisterStatus registerStatus;
  final AuthUser? authUser;
  final User? user;
  final String errorMessage;
  final AuthGoogleStatus? authGoogleStatus;

  AuthState(
      {
      this.authStatus = AuthStatus.checking,
      this.registerStatus = RegisterStatus.notRegistered,
      this.authUser,
      this.user,
      this.errorMessage = '',
      this.authGoogleStatus = AuthGoogleStatus.checking,
      });

  AuthState copyWith({
    AuthStatus? authStatus,
    RegisterStatus? registerStatus,
    AuthUser? authUser,
    User? user,
    String? errorMessage,
    AuthGoogleStatus? authGoogleStatus,
  }) =>
      AuthState(
          authStatus: authStatus ?? this.authStatus,
          registerStatus: registerStatus ?? this.registerStatus,
          authUser: authUser ?? this.authUser,
          user: user ?? this.user,
          errorMessage: errorMessage ?? this.errorMessage,
          authGoogleStatus: authGoogleStatus ?? this.authGoogleStatus
          );
}
