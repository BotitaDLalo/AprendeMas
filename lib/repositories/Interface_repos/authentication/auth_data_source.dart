import 'package:aprende_mas/models/models.dart';

abstract class AuthDataSource {
  Future<AuthUser> login(String email, String password);

  Future<AuthUser> signin(
      {required String name,
      required String lastname,
      required String secondLastname,
      required String password,
      required String role,
      required String fcmToken});

  Future<AuthUser> checkAuthStatus(String token);

  Future<bool> resetPasswordRequest(String email);

  Future<AuthUser> loginGoogle();

  Future<AuthUser> registerMissingDataGoogle(
      String names, String lastname, String secondLastname, String role);

  Future<bool> verifyExistingFcmToken(int id, String fcmToken, String role);

  Future<bool> verifyEmailSignin(String email);

  Future<AuthUser> registerAuthorizationCodeUser(String code, String? idToken);
}
