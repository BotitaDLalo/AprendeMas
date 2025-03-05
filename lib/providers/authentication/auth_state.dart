import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/config/utils/catalog_names.dart';

class AuthState {
  // final User? user;

  final AuthStatus? authStatus;
  final AuthUser? authUser;
  final AuthenticatedType? authenticatedType;
  final RegisterStatus registerStatus;

  final String errorMessage;
  final String errorComment;

  final ErrorHandlingStyle errorHandlingStyle;

  final AuthGoogleStatus? authGoogleStatus;
  final bool theresMissingData;
  final AuthConectionType authConectionType;

  final bool isPendingAuthorizationUser;
  final bool isDeniedUserAuthorization;

  AuthState(
      {this.authStatus = AuthStatus.checking,
      this.registerStatus = RegisterStatus.notRegistered,
      this.authUser,
      // this.user,
      this.errorMessage = '',
      this.errorComment = '',
      this.authGoogleStatus = AuthGoogleStatus.checking,
      this.authenticatedType = AuthenticatedType.undefined,
      this.authConectionType = AuthConectionType.unverified,
      this.theresMissingData = false,
      this.isDeniedUserAuthorization = false,
      this.isPendingAuthorizationUser = false,
      this.errorHandlingStyle = ErrorHandlingStyle.undefined});

  AuthState copyWith(
          {AuthStatus? authStatus,
          RegisterStatus? registerStatus,
          AuthUser? authUser,
          // User? user,
          AuthenticatedType? authenticatedType,
          String? errorMessage,
          String? errorComment,
          AuthGoogleStatus? authGoogleStatus,
          bool? theresMissingData,
          AuthConectionType? authConectionType,
          bool? isDeniedUserAuthorization,
          bool? isPendingAuthorizationUser,
          ErrorHandlingStyle? errorHandlingStyle}) =>
      AuthState(
          authStatus: authStatus ?? this.authStatus,
          registerStatus: registerStatus ?? this.registerStatus,
          authUser: authUser ?? this.authUser,
          // user: user ?? this.user,
          authenticatedType: authenticatedType ?? this.authenticatedType,
          errorMessage: errorMessage ?? this.errorMessage,
          errorComment: errorComment ?? this.errorComment,
          authGoogleStatus: authGoogleStatus ?? this.authGoogleStatus,
          theresMissingData: theresMissingData ?? this.theresMissingData,
          authConectionType: authConectionType ?? this.authConectionType,
          isDeniedUserAuthorization:
              isDeniedUserAuthorization ?? this.isDeniedUserAuthorization,
          isPendingAuthorizationUser:
              isPendingAuthorizationUser ?? this.isPendingAuthorizationUser,
          errorHandlingStyle: errorHandlingStyle ?? this.errorHandlingStyle);
}
