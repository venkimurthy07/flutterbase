import 'package:flutter/cupertino.dart';

/**
 * Created by venkateshmurthytp on 23,June,2021
 */
class ServerException implements Exception {
  String message;

  ServerException({@required this.message});
}

class ValidationException {
  final String message;

  ValidationException({@required this.message});
}

class CacheException implements Exception {}
