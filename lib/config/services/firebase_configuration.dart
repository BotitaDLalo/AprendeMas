import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/firebase_options.dart';
import 'package:aprende_mas/repositories/Implement_repos/notices/db_local_notices_repository_impl.dart';

class FirebaseConfiguration {
  static Future<void> initializeFCM() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static Future<NotificationSettings> requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    return settings;
  }

  static Future<String?> getFcmToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    return fcmToken;
  }

  static void onMessagesForeground() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        final dbLocalNotices = DbLocalNoticesRepositoryImpl();
        final notice = onNewMessage(message);
        dbLocalNotices.storeNotification(notice);
        print('Message also contained a notification: ${message.notification}');
      }
    });
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
