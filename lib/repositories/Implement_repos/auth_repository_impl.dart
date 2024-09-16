import 'package:aprende_mas/models/authentication/user.dart';
import 'package:aprende_mas/repositories/Implement_repos/auth_data_source_impl.dart';
import 'package:aprende_mas/repositories/Interface_repos/auth_data_source.dart';
import 'package:aprende_mas/repositories/Interface_repos/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl({AuthDataSource? dataSource})
      : dataSource = dataSource ?? AuthDataSourceImpl();

  @override
  Future<User> checkAuthStatus(String token) {
    return dataSource.checkAuthStatus(token);
  }

  @override
  Future<User> login(String email, String password) {
    return dataSource.login(email, password);
  }
}
