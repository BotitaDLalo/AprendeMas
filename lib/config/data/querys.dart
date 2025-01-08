class Querys {
  static List<String> querysCreateTables() => [
        "CREATE TABLE tbUsuarioActivo(UsuarioId INTEGER PRIMARY KEY, NombreUsuario TEXT, Correo TEXT, FechaLimiteActivo TEXT, Rol TEXT);",

        "CREATE TABLE tbActividades(ActividadId INTEGER PRIMARY KEY, NombreActividad TEXT, Descripcion TEXT, FechaCreacion TEXT, FechaLimite TEXT);",

        "CREATE TABLE tbMaterias(MateriaId INTEGER PRIMARY KEY, NombreMateria TEXT, Descripcion TEXT, ActividadId INTEGER, FOREIGN KEY (ActividadId) REFERENCES tbActividades(ActividadId));",
        
        "CREATE TABLE tbGruposAlumno(GrupoAlumnoId INTEGER PRIMARY KEY, NombreGrupo TEXT, Descripcion TEXT, CodigoColor TEXT, MateriaId INTEGER, FOREIGN KEY (MateriaId) REFERENCES tbMaterias(MateriaId));",
        
        "CREATE TABLE tbMateriasAlumno(MateriaAlumnoId INTEGER PRIMARY KEY, NombreMateria TEXT, Descripcion TEXT, MateriaId INTEGER, FOREIGN KEY (MateriaId) REFERENCES tbMaterias(MateriaId));",
        
        "CREATE TABLE tbEntregaActividades(EntregaId INTEGER PRIMARY KEY, FechaEntrega TEXT, UsuarioId INTEGER, ActividadId INTEGER);",
        
        "CREATE TABLE tbNotificaciones(MensajeId TEXT, Titulo TEXT, Descripcion TEXT, FechaEnvio TEXT, Data TEXT, ImagenURL TEXT);",
      ];

  static List<String> querysDeleteTables() => [
        "DELETE FROM tbUsuarioActivo;",
        "DELETE FROM tbGruposAlumno;",
        "DELETE FROM tbMateriasAlumno;",
        "DELETE FROM tbMaterias;",
        "DELETE FROM tbActividades;",
        "DELETE FROM tbEntregaActividades;",
        "DELETE FROM tbNotificaciones;"
      ];

  static String querytbUsuarioActivoInsert() =>
      "INSERT INTO tbUsuarioActivo(UsuarioId, NombreUsuario, Correo, FechaLimiteActivo, Rol) VALUES(?,?,?,?,?)";

  static String querytbUsuarioActivoUpdate() =>
      "UPDATE tbUsuarioActivo SET FechaLimiteActivo = ?";

  static String querytbNotificacionesInsert() =>
      "INSERT INTO tbNotificaciones(MensajeId, Titulo, Descripcion, FechaEnvio, Data, ImagenURL) VALUES(?,?,?,?,?,?);";

  static String querytbNotificacionesDeleteWhere() => "DELETE FROM tbNotificaciones WHERE FechaEnvio = ?";
}
