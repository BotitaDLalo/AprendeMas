import 'package:aprende_mas/models/models.dart';
abstract class AuthRepository {
  Future<User> login(String email, String password);

  Future<User> checkAuthStatus(String token);
}