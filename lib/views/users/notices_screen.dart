import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/providers/providers.dart';
import 'package:aprende_mas/views/widgets/widgets.dart';

class NoticesScreen extends ConsumerStatefulWidget {
  const NoticesScreen({super.key});

  @override
  NoticesScreenState createState() => NoticesScreenState();
}

class NoticesScreenState extends ConsumerState<NoticesScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(notificationsProvider.notifier).getLsNotices();
  }

  @override
  Widget build(BuildContext context) {
    final lsNotices = ref.watch(notificationsProvider);
    final noticesNotifier = ref.read(notificationsProvider.notifier);
    showModalBottom(String sentDate) {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16), // Bordes redondeados
          ),
        ),
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text('Eliminar notificación'),
                  onTap: () {
                    noticesNotifier.deleteNotification(sentDate);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: lsNotices.length,
              itemBuilder: (BuildContext context, int index) {
                final notification = lsNotices[index];
                return GestureDetector(
                    onLongPress: () {
                      showModalBottom(notification.sentDate);
                    },
                    child: ElementTile(
                      icon: Icons.notifications,
                      iconSize: 28,
                      iconColor: Colors.white,
                      title: notification.title,
                      subtitle: notification.sentDate,
                      onTapFunction: () {
                        NotificationModel notice = NotificationModel(
                            messageId: notification.messageId,
                            title: notification.title,
                            body: notification.body,
                            sentDate: notification.sentDate);
                        context.push('/notification-content', extra: notice);
                      },
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
