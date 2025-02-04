import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/repositories/Implement_repos/notices/db_local_notices_repository_impl.dart';

class FirebaseCM{
    static Future<String?> getFcmToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    return fcmToken;
  }

  static Notice onNewMessage(RemoteMessage message) {
    final notification = Notice(
        messageId:
            message.messageId?.replaceAll(':', '').replaceAll('%', '') ?? '',
        title: message.notification!.title ?? '',
        body: message.notification!.body ?? '',
        sentDate: message.sentTime.toString(),
        data: "",
        imageUrl: Platform.isAndroid
            ? message.notification!.android?.imageUrl ?? ""
            : message.notification!.apple?.imageUrl ?? "");
    return notification;
  }
}