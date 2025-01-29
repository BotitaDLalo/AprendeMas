import 'package:aprende_mas/config/utils/packages.dart';

class ElementTile extends ConsumerWidget {
  // final Notice notification;
  final String title;
  final String subtitle;
  final Icon icon;
  final String trailing;
  final GestureTapCallback onTapFunction;
  const ElementTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTapFunction,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 45,
            height: 45,
            color: Colors.grey[300],
            // child: const Icon(Icons.notifications, color: Colors.black),
            child: icon,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        trailing: Text(
          trailing,
          style: const TextStyle(fontSize: 14),
        ),
        onTap: onTapFunction
        // () {
        //   Notice notice = Notice(
        //       messageId: notification.messageId,
        //       title: notification.title,
        //       body: notification.body,
        //       sentDate: notification.sentDate);
        //   context.push('/notification-content', extra: notice);
        // },
        );
  }
}
