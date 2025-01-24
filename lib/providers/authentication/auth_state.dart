import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/config/utils/catalog_names.dart';

class AuthState {
  final AuthStatus? authStatus;
  final RegisterStatus registerStatus;
  final AuthUser? authUser;
  final AuthenticatedType? authenticatedType;
  final User? user;
  final String errorMessage;
  final AuthGoogleStatus? authGoogleStatus;
  final bool theresMissingData;
  final AuthConectionType authConectionType;

  AuthState(
      {this.authStatus = AuthStatus.checking,
      this.registerStatus = RegisterStatus.notRegistered,
      this.authUser,
      this.user,
      this.errorMessage = '',
      this.authGoogleStatus = AuthGoogleStatus.checking,
      this.authenticatedType = AuthenticatedType.undefined,
      this.authConectionType = AuthConectionType.unverified,
      this.theresMissingData = false});

  AuthState copyWith(
          {AuthStatus? authStatus,
          RegisterStatus? registerStatus,
          AuthUser? authUser,
          User? user,
          AuthenticatedType? authenticatedType,
          String? errorMessage,
          AuthGoogleStatus? authGoogleStatus,
          bool? theresMissingData,
          AuthConectionType? authConectionType}) =>
      AuthState(
          authStatus: authStatus ?? this.authStatus,
          registerStatus: registerStatus ?? this.registerStatus,
          authUser: authUser ?? this.authUser,
          user: user ?? this.user,
          authenticatedType: authenticatedType ?? this.authenticatedType,
          errorMessage: errorMessage ?? this.errorMessage,
          authGoogleStatus: authGoogleStatus ?? this.authGoogleStatus,
          theresMissingData: theresMissingData ?? this.theresMissingData,
          authConectionType: authConectionType ?? this.authConectionType);
}
