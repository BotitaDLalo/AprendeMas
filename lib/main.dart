import 'package:aprende_mas/config/environment/environment.dart';
import 'package:aprende_mas/config/router/router.dart';
import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/config/services/services.dart';
import 'package:aprende_mas/config/data/data.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/providers/providers.dart';

void main() async {
  await Environment.initEnvironment();
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseConfiguration.initializeFCM();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  Future<Database> database() async {
    return DbLocal.initDatabase();
  }

  void onNewNotice(WidgetRef ref) {
    Notice notice = Notice.noticeVoid();
    final notices = ref.read(noticesProvider.notifier);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        notice = FirebaseCM.onNewMessage(message);
        notices.onNewNotice(notice);
        print("CAYO UNA NOTIFICACION");
      }
    });
  }

  void getLsNotices(WidgetRef ref) {
    ref.read(noticesProvider.notifier).getLsNotices();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(goRouterProvider);
    getLsNotices(ref);
    onNewNotice(ref);

    // database().then(
    //   (db) {
    //     final notice = FirebaseConfiguration.onMessagesForeground();
    //   },
    // );

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme(),
    );
  }
}
