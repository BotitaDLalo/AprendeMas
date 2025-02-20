import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';

class FirebasecmState {
  final AuthorizationStatus status;

  FirebasecmState({
    this.status = AuthorizationStatus.notDetermined,
  });

  FirebasecmState copyWith(
          {AuthorizationStatus? status, List<NotificationModel>? notices}) =>
      FirebasecmState(
        status: status ?? this.status,
      );
}
