import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/providers/providers.dart';
import 'users.dart';

class NoticesScreen extends ConsumerStatefulWidget {
  const NoticesScreen({super.key});

  @override
  NoticesScreenState createState() => NoticesScreenState();
}

class NoticesScreenState extends ConsumerState<NoticesScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(noticesProvider.notifier).getLsNotices();
  }

  @override
  Widget build(BuildContext context) {
    final lsNotices = ref.watch(noticesProvider);
    final noticesNotifier = ref.read(noticesProvider.notifier);
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
                print(index);
                final notification = lsNotices[index];
                print(notification);
                return GestureDetector(
                  onLongPress: () {
                    showModalBottom(notification.sentDate);
                  },
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 40,
                        height: 40,
                        color: Colors.grey[300],
                        child: const Icon(Icons.notifications,
                            color: Colors.black),
                      ),
                    ),
                    title: Text(
                      notification.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    subtitle: Text(
                      notification.sentDate,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    onTap: () {
                      Notice notice = Notice(
                          messageId: notification.messageId,
                          title: notification.title,
                          body: notification.body,
                          sentDate: notification.sentDate);
                      context.push('/notification-content', extra: notice);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
