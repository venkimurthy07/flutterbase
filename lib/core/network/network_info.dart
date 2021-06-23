import 'package:data_connection_checker/data_connection_checker.dart';

/**
 * Created by venkateshmurthytp on 23,June,2021
 */
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
