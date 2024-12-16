import 'package:aprende_mas/config/router/router_notifier.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/auth_provider.dart';

final routerNotifierProvider = Provider((ref) {
  final authNotifier = ref.read(authProvider.notifier);
  return RouterNotifier(authNotifier);
});
