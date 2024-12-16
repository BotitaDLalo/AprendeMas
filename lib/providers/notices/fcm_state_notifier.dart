import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/config/services/services.dart';
import 'package:aprende_mas/providers/notices/fcm_state.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/repositories/Implement_repos/notices/db_local_notices_repository_impl.dart';

class FcmStateNotifier extends StateNotifier<FcmState> {
  final DbLocalNoticesRepositoryImpl noticesRepositoryImpl;

  FcmStateNotifier({required this.noticesRepositoryImpl}) : super(FcmState());

  void onRequestPermissions() async {
    NotificationSettings settings =
        await FirebaseConfiguration.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional) {
      _setPermissionsChanged(settings.authorizationStatus);
      print('User granted permission: ${settings.authorizationStatus}');
    }
  }

 //TODO:
  void onLoadNotifications() async {
    List<Notice> lsNotices = await noticesRepositoryImpl.getLsNotifications();
    state = state.copyWith(notifications: lsNotices);
  }

  // void onNewMessage() async {
  //   final lsNotices = await noticesRepositoryImpl.getLastNotification();
  //   final countNotices =
  //       await DbLocalNoticesDataSourceImpl.gettbNotificacionesCount();
  //   final countNotice = state.notifications.length;

  //   final notice = lsNotices[0];

  //   _setNoticeList(notice);
  //   // if (lsNotices.isNotEmpty) {
  //   //   if (countNotice == 0) {
  //   //     final notice = lsNotices[0];
  //   //     _setNoticeList(notice);
  //   //   } else if (lsNotices[0].sentDate !=
  //   //       state.notifications[countNotice - 1].sentDate) {
  //   //     final notice = lsNotices[0];
  //   //     _setNoticeList(notice);
  //   //   }
  //   // } else {
  //   //   return;
  //   // }
  // }

  _setPermissionsChanged(AuthorizationStatus status) {
    state = state.copyWith(status: AuthorizationStatus.authorized);
  }

  _setNoticeList(Notice notice) {
    final lsNotices = List.from(state.notifications);
    state = state.copyWith(notifications: [notice, ...lsNotices]);
  }

  // static Notice remoteMessage(RemoteMessage message) {
  //   final notification = Notice(
  //       messageId:
  //           message.messageId?.replaceAll(':', '').replaceAll('%', '') ?? '',
  //       title: message.notification!.title ?? '',
  //       body: message.notification!.body ?? '',
  //       sentDate: message.sentTime ?? DateTime.now(),
  //       data: message.data,
  //       imageUrl: Platform.isAndroid
  //           ? message.notification!.android?.imageUrl
  //           : message.notification!.apple?.imageUrl);
  //   return notification;
  // }
}
