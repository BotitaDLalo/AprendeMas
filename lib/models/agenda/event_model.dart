class Event {
  final int? eventId; // Identificador único
  final int teacherId; // Relación con el docente que crea el evento
  final DateTime startDate; // Fecha y hora de inicio
  final DateTime endDate; // Fecha y hora de fin
  final String title; // Título del evento
  final String description; // Descripción del evento
  final String color; // Código de color (en formato hexadecimal)
  final List<int>? groupIds; // Lista de IDs de grupos relacionados
  final List<int>? subjectIds; // Lista de IDs de materias relacionadas

  Event({
    this.eventId,
    required this.teacherId,
    required this.startDate,
    required this.endDate,
    required this.title,
    required this.description,
    required this.color,
    this.groupIds,
    this.subjectIds,
  });
}
