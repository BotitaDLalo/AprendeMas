import 'package:aprende_mas/models/models.dart';
abstract class AuthRepository {
  Future<User> login(String email, String password);

  Future<UserSigin> sigin(String name, String email, String password, String role);

  Future<User> checkAuthStatus(String token);
}