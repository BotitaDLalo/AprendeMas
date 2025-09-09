import 'package:aprende_mas/repositories/Implement_repos/authentication/auth_user_offline_data_source_impl.dart';
import 'package:aprende_mas/repositories/Interface_repos/authentication/auth_user_offline_data_source.dart';
import 'package:aprende_mas/repositories/Interface_repos/authentication/auth_user_offline_repository.dart';


class AuthUserOfflineRepositoryImpl implements AuthUserOfflineRepository {
  final AuthUserOfflineDataSource dataSource;

  AuthUserOfflineRepositoryImpl({AuthUserOfflineDataSource? dataSource})
      : dataSource = dataSource ?? AuthUserOfflineDataSourceImpl();
      
  @override
  Future<void> deleteUser() {
    return dataSource.deleteUser();
  }

  @override
  Future<List<Map<String, Object?>>> getUser() {
    return dataSource.getUser();
  }

  @override
  Future<void> updateUser(String fechaLimiteActivo) {
    return dataSource.updateUser(fechaLimiteActivo);
  }

  @override
  Future<void> insertUser(int usuarioId, String nombreUsuario, String correo,
      String fechaLimiteActivo, String rol) {
    return dataSource.insertUser(
        usuarioId, nombreUsuario, correo, fechaLimiteActivo, rol);
  }
}