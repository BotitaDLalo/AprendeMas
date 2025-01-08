import 'package:aprende_mas/models/models.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }
enum AuthenticatedType {auth, authGoogle, undefined}

enum AuthGoogleStatus { checking, authenticated, notAuthenticated }

enum RegisterStatus { registered, notRegistered }


class AuthState {
  final AuthStatus? authStatus;
  final RegisterStatus registerStatus;
  final AuthUser? authUser;
  final AuthenticatedType? authenticatedType;
  final User? user;
  final String errorMessage;
  final AuthGoogleStatus? authGoogleStatus;
  final bool theresMissingData;

  AuthState(
      {this.authStatus = AuthStatus.checking,
      this.registerStatus = RegisterStatus.notRegistered,
      this.authUser,
      this.user,
      this.errorMessage = '',
      this.authGoogleStatus = AuthGoogleStatus.checking,
      this.authenticatedType = AuthenticatedType.undefined,
      this.theresMissingData = false});

  AuthState copyWith({
    AuthStatus? authStatus,
    RegisterStatus? registerStatus,
    AuthUser? authUser,
    User? user,
    AuthenticatedType? authenticatedType,
    String? errorMessage,
    AuthGoogleStatus? authGoogleStatus,
    bool? theresMissingData,
  }) =>
      AuthState(
          authStatus: authStatus ?? this.authStatus,
          registerStatus: registerStatus ?? this.registerStatus,
          authUser: authUser ?? this.authUser,
          user: user ?? this.user,
          authenticatedType: authenticatedType ?? this.authenticatedType,
          errorMessage: errorMessage ?? this.errorMessage,
          authGoogleStatus: authGoogleStatus ?? this.authGoogleStatus,
          theresMissingData: theresMissingData ?? this.theresMissingData);
}
