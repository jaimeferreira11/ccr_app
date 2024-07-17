class ServerException implements Exception {}

class CacheException implements Exception {}

class AuthException implements Exception {}

class ScanException implements Exception {}

class DataBaseException implements Exception {
  final String mensaje;

  DataBaseException({required this.mensaje});
}
