abstract class AuthUserOfflineRepository {
  Future<List<Map<String, Object?>>> getUser();

  Future<void> insertUser(int usuarioId, String nombreUsuario, String correo, String fechaLimiteActivo, String rol);

  Future<void> updateUser(String fechaLimiteActivo);

  Future<void> deleteUser();
}