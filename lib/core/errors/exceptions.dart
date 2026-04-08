class UnauthorizedException implements Exception {
  final String message;

  UnauthorizedException([this.message = 'Unauthorized']);

  @override
  String toString() => 'UnauthorizedException: $message';
}

class ClientException implements Exception {
  final String message;
  final String? errorDetails;

  ClientException(this.message, {this.errorDetails});

  @override
  String toString() => 'ClientException: $message';
}

class ServerException implements Exception {
  final String message;
  final String? errorDetails;

  ServerException(this.message, {this.errorDetails});

  @override
  String toString() => 'ServerException: $message';
}
