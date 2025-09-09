class WrongCredentials implements Exception {
  final String errorMessage;
  WrongCredentials({required this.errorMessage});
  @override
  String toString() => errorMessage;
}

class UserAlreadyExists implements Exception {
  final String errorMessage;
  UserAlreadyExists({required this.errorMessage});
  @override
  String toString() => errorMessage;
}

class InvalidToken implements Exception {}

class InvalidAuthorizationCode implements Exception {
  final String errorMessage;
  InvalidAuthorizationCode(
      {this.errorMessage = "Código de autorización inválido."});
}

class ExpiredAuthorizationCode implements Exception {
  final String errorMessage;
  ExpiredAuthorizationCode(
      {this.errorMessage = "Código de autorización expirado."});
}

class FcmTokenVerificatioFailed implements Exception {
  final String message;

  FcmTokenVerificatioFailed({this.message = "No se pudo verificar el token."});
}

class ConnectionTimeout implements Exception {
  final String message;
  ConnectionTimeout({this.message = "Se agotó el tiempo de respuesta."});
}

class InvalidEmailSignin implements Exception {
  final String errorMessage;
  final String errorComment;

  InvalidEmailSignin({required this.errorMessage, required this.errorComment});
}

class UncontrolledError implements Exception {
  final String message;

  UncontrolledError({this.message = "Ocurrio un error inesperado"});
}
