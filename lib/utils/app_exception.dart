class AppException implements Exception {
  final String message;
  final int code;

  AppException(this.message, this.code);

  @override
  String toString() {
    return 'AppException{message: $message, code: $code}';
  }
}

class NetworkException extends AppException {
  NetworkException(String message, int code) : super(message, code);
}

class ServerException extends AppException {
  ServerException(String message, int code) : super(message, code);
}

class CacheException extends AppException {
  CacheException(String message, int code) : super(message, code);
}

class UnknownException extends AppException {
  UnknownException(String message, int code) : super(message, code);
}

class InvalidInputException extends AppException {
  InvalidInputException(String message, int code) : super(message, code);
}

class UnauthorizedException extends AppException {
  UnauthorizedException(String message, int code) : super(message, code);
}

class ForbiddenException extends AppException {
  ForbiddenException(String message, int code) : super(message, code);
}

class NotFoundException extends AppException {
  NotFoundException(String message, int code) : super(message, code);
}

class ConflictException extends AppException {
  ConflictException(String message, int code) : super(message, code);
}

class InternalServerException extends AppException {
  InternalServerException(String message, int code) : super(message, code);
}
