import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/auth_provider.dart';
class AppBarHome extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
  const AppBarHome({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(authProvider);
    String userName() {
      String userName = auth.authUser!.userName;
      return userName;
    }

    return AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                // color: Colors.grey[400],
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                // color: Colors.white,
              ),
            ),
          ],
        ),
        flexibleSpace: Container(
            // decoration: const BoxDecoration(gradient: AppTheme.degradedBlue),
            ),
        // backgroundColor: Colors.blue,
        // toolbarHeight: 60,
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                color: Colors.white,
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                  // if (auth.authGoogleStatus == AuthGoogleStatus.authenticated) {
                  //   ref.watch(authProvider.notifier).logoutGoogle();
                  // } else if (auth.authStatus == AuthStatus.authenticated) {
                  //   ref.watch(authProvider.notifier).logout();
                  // }
                  // ref.read(noticesProvider.notifier).clearNotifications();
                },
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black,
                  size: 35,
                )),
          )
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
