class SubjectsRow {
  final String nombreMateria;
  final String? descripcion;
  final String? codigoColor;

  SubjectsRow({
    required this.nombreMateria,
    this.descripcion,
    this.codigoColor,
  });

    Map<String, dynamic> toJsonGroupsSubjects() {
    return {
      "NombreMateria": nombreMateria,
      if (descripcion != null) "Descripcion": descripcion,
      // if (codigoColor != null) "codigoColor": codigoColor
    };
  }

}
