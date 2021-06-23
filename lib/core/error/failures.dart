import 'package:equatable/equatable.dart';

/**
 * Created by venkateshmurthytp on 23,June,2021
 */
abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {
  final String message;

  ServerFailure({this.message});
}

// Cache failure
class CacheFailure extends Failure {}

// Network Failure
class NetworkFailure extends Failure {}
