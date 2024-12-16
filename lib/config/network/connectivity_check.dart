import 'package:aprende_mas/config/utils/packages.dart';

class ConnectivityCheck {
  
  static Future<bool> checkInternetConnectivity() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.wifi)) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e);
    }
  }
}
