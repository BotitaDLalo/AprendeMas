class Activities {
  final String name;
  final String description;
  final DateTime deadline;
  final DateTime registrationDate;
  final dynamic recurses;

  Activities(
      {required this.name,
      required this.description,
      required this.deadline,
      required this.registrationDate,
      required this.recurses});
}
