class ActiveUser {
  final int userId;
  final String userName;
  final String email;
  final String activeDueDate;
  final String role;

  ActiveUser(
      {required this.userId,
      required this.userName,
      required this.email,
      required this.activeDueDate,
      required this.role});
}