import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/providers.dart';
import 'dart:async';

class NoticesTeacherScreen extends ConsumerStatefulWidget {
  const NoticesTeacherScreen({super.key});

  @override
  NoticesScreenState createState() => NoticesScreenState();
}

class NoticesScreenState extends ConsumerState<NoticesTeacherScreen> {
  static late StreamController<void> streamController;
  @override
  void initState() {
    super.initState();
    streamController = StreamController.broadcast();
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final lsNotices = ref.watch(fcmProvider).notifications;

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: StreamBuilder<void>(
                stream: streamController.stream,
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: lsNotices.length,
                    itemBuilder: (BuildContext context, int index) {
                      final notification = lsNotices[index];
                      return ListTile(
                        title: Text(notification.title),
                        subtitle: Text(notification.body),
                        // Puedes descomentar la siguiente línea si quieres mostrar imágenes
                        // leading: notification.imageUrl != null
                        //     ? Image.network(notification.imageUrl!)
                        //     : null,
                        onTap: () {},
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
