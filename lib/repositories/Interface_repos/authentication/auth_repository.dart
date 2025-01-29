import 'package:aprende_mas/models/models.dart';

abstract class AuthRepository {
  Future<AuthUser> login(String email, String password);

  Future<User> signin(String name, String lastname, String secondLastname,String email, String password, String role);

  Future<AuthUser> checkAuthStatus(String token);

  Future<bool> resetPasswordRequest(String email);

  Future<AuthUser> loginGoogle();

  Future<AuthUser> registerMissingDataGoogle(
      String names, String lastname, String secondLastname, String role);
}
