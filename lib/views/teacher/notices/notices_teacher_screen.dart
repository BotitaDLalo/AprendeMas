import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/providers.dart';

class NoticesTeacherScreen extends ConsumerStatefulWidget {
  const NoticesTeacherScreen({super.key});

  @override
  NoticesScreenState createState() => NoticesScreenState();
}

class NoticesScreenState extends ConsumerState<NoticesTeacherScreen> {
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
                      borderRadius: BorderRadius.circular(
                          8), // Radio de los bordes, controla lo redondeado
                      child: Container(
                        width: 40, // Establece el ancho
                        height: 40, // Establece la altura
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
                      // showDialog(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return AlertDialog(
                      //       title: const Text('Modal Centrado'),
                      //       content: const Text(
                      //           'Este es un modal centrado con opciones.'),
                      //       actions: [
                      //         TextButton(
                      //           onPressed: () {
                      //             Navigator.of(context).pop();
                      //           },
                      //           child: const Text('Cerrar'),
                      //         ),
                      //       ],
                      //     );
                      //   },
                      // );
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
