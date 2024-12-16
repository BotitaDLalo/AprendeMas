import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';

class FcmState {
  final AuthorizationStatus status;
  final List<Notice> notifications;

  FcmState(
      {this.status = AuthorizationStatus.notDetermined,
      this.notifications = const []});

  FcmState copyWith(
          {AuthorizationStatus? status, List<Notice>? notifications}) =>
      FcmState(
          status: status ?? this.status,
          notifications: notifications ?? this.notifications);
}
