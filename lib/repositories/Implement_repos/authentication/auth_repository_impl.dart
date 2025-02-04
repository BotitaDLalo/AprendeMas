import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/repositories/Implement_repos/authentication/auth_data_source_impl.dart';
import 'package:aprende_mas/repositories/Interface_repos/authentication/auth_data_source.dart';
import 'package:aprende_mas/repositories/Interface_repos/authentication/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl({AuthDataSource? dataSource})
      : dataSource = dataSource ?? AuthDataSourceImpl();

  @override
  Future<AuthUser> login(String email, String password) {
    return dataSource.login(email, password);
  }

  @override
  Future<User> signin(String name,String lastname, String secondLastname, String email, String password, String role) {
    return dataSource.signin(name, lastname, secondLastname, email, password, role);
  }

  @override
  Future<AuthUser> checkAuthStatus(String token) {
    return dataSource.checkAuthStatus(token);
  }

  @override
  Future<bool> resetPasswordRequest(String email) {
    return dataSource.resetPasswordRequest(email);
  }

  @override
  Future<AuthUser> loginGoogle() {
    return dataSource.loginGoogle();
  }

  @override
  Future<AuthUser> registerMissingDataGoogle(
      String names, String lastname, String secondLastname, String role) {
    return dataSource.registerMissingDataGoogle(
        names, lastname, secondLastname, role);
  }
}
