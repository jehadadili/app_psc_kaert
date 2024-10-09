import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:market/src/core/network/netowrk_info.dart';

class NetworkInfoImpl implements NetowrkInfo {
  final InternetConnection internetConnection;

  NetworkInfoImpl({required this.internetConnection});
  @override
  Future<bool> get isconected async =>
      await internetConnection.hasInternetAccess;
}
