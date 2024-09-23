import 'package:aprende_mas/models/models.dart';

import '../../models/authentication/user.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

enum RegisterStatus { registered, notRegistered }

class AuthState {
  final AuthStatus authStatus;
  final RegisterStatus registerStatus;
  final User? user;
  final UserSigin? userSigin;
  final String errorMessage;

  AuthState(
      {this.authStatus = AuthStatus.checking,
      this.registerStatus = RegisterStatus.notRegistered,
      this.user,
      this.userSigin,
      this.errorMessage = ''});

  AuthState copyWith({
    AuthStatus? authStatus,
    RegisterStatus? registerStatus,
    User? user,
    UserSigin? userSigin,
    String? errorMessage,
  }) =>
      AuthState(
          authStatus: authStatus ?? this.authStatus,
          registerStatus: registerStatus ?? this.registerStatus,
          user: user ?? this.user,
          userSigin: userSigin ?? this.userSigin,
          errorMessage: errorMessage ?? this.errorMessage);
}
