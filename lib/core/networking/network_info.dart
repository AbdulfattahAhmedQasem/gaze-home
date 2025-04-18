import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  const NetworkInfo();
  Future<bool> get isConnected;
}

class NetworkInfoImpl extends NetworkInfo {
  const NetworkInfoImpl(this._internetConnection);

  final InternetConnection _internetConnection;

  @override
  Future<bool> get isConnected => _internetConnection.hasInternetAccess;
}
