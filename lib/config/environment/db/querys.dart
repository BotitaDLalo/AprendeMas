class Querys {
  static List<String> querysCreateTables() {
    return [
      "CREATE TABLE tbUsuarioActivo(UsuarioId INTEGER PRIMARY KEY, NombreUsuario TEXT, Correo TEXT, FechaLimiteActivo TEXT, Rol TEXT);",
      "CREATE TABLE tbGruposAlumno(GrupoId INTEGER PRIMARY KEY, NombreGrupo TEXT, Descripcion TEXT);",
      "CREATE TABLE tbMateriasAlumno(MateriaId INTEGER PRIMARY KEY, NombreMateria TEXT, Descripcion TEXT);",
      "CREATE TABLE tbActividades(ActividadId INTEGER PRIMARY KEY, NombreActividad TEXT, Descripcion TEXT, FechaCreacion TEXT, FechaLimite TEXT, MateriaId);",
      "CREATE TABLE tbEntregaActividades(EntregaId INTEGER PRIMARY KEY, FechaEntrega TEXT, UsuarioId INTEGER, ActividadId INTEGER);",
      "CREATE TABLE tbNotificaciones(MensajeId TEXT PRIMARY KEY, Titulo TEXT, Descripcion TEXT, FechaEnvio TEXT, Data TEXT, ImagenURL TEXT);",
    ];
  }

  static List<String> querysDeleteTables() {
    return [
      "DELETE FROM tbUsuarioActivo;",
      "DELETE FROM tbGruposAlumno;",
      "DELETE FROM tbMateriasAlumno;",
      "DELETE FROM tbActividades;",
      "DELETE FROM tbEntregaActividades;",
      "DELETE FROM tbNotificaciones"
    ];
  }

  static String querytbUsuarioActivoInsert() {
    return "INSERT INTO tbUsuarioActivo(UsuarioId, NombreUsuario, Correo, FechaLimiteActivo, Rol) VALUES(?,?,?,?,?)";
  }

  static String querytbUsuarioActivoUpdate() {
    return "UPDATE tbUsuarioActivo SET FechaLimiteActivo = ?";
  }

  static String querytbNotificacionesInsert() {
    return "INSERT INTO tbNotificaciones(MensajeId, Titulo, Descripcion, FechaEnvio, Data, ImagenURL) VALUES(?,?,?,?,?,?);";
  }
  
}
