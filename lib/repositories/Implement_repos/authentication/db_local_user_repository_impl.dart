import 'package:aprende_mas/repositories/Implement_repos/authentication/db_local_user_data_source_impl.dart';
import 'package:aprende_mas/repositories/Interface_repos/authentication/db_local_user_data_source.dart';
import 'package:aprende_mas/repositories/Interface_repos/authentication/db_local_user_repository.dart';

class DbLocalUserRepositoryImpl implements DbLocalUserRepository {
  final DbLocalUserDataSource dataSource;

  DbLocalUserRepositoryImpl({DbLocalUserDataSource? dataSource})
      : dataSource = dataSource ?? DbLocalUserDataSourceImpl();

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
