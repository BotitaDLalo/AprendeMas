class WrongCredentials implements Exception {
  final String message;
  WrongCredentials({required this.message});
  @override
  String toString() => message;
}

class InvalidToken implements Exception {}

class ConnectionTimeout implements Exception {}

class CustomError implements Exception {
  final String message;
  final int errorCode;
  CustomError({required this.message, required this.errorCode});
}
