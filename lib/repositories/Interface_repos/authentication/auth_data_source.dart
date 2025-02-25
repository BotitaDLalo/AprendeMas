import 'package:aprende_mas/models/models.dart';

abstract class AuthDataSource {
  Future<AuthUser> login(String email, String password);

  Future<User> signin(String name, String lastname, String secondLastname,
      String email, String password, String role, String fcmToken);

  Future<AuthUser> checkAuthStatus(String token);

  Future<bool> resetPasswordRequest(String email);

  Future<AuthUser> loginGoogle();

  Future<AuthUser> registerMissingDataGoogle(
      String names, String lastname, String secondLastname, String role);

  Future<bool> verifyExistingFcmToken(int id,String fcmToken, String role);
}
