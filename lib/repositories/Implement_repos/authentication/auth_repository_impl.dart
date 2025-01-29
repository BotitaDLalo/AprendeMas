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
  registerMissingDataGoogle(String names, String lastname, String secondLastname, String role) {
    // TODO: implement registerMissingDataGoogle
    throw UnimplementedError();
  }
  
  @override
  Future<User> signin(String name, String email, String password, String role) {
    // TODO: implement signin
    throw UnimplementedError();
  }
}
