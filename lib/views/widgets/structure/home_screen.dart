import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/providers/authentication/auth_provider.dart';
import 'package:aprende_mas/providers/providers.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:aprende_mas/config/utils/catalog_names.dart';
import 'package:aprende_mas/providers/notices/notices_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final List<WidgetOptions> lsWidgetsOptions;
  const HomeScreen({super.key, required this.lsWidgetsOptions});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // int selectedIndex = 0;
  final itemTappedProvider = StateProvider<int>((ref) => 0);

  void onItemTapped(int index) {
    ref.read(itemTappedProvider.notifier).state = index;
  }

  @override
  Widget build(BuildContext context) {
    final element =
        widget.lsWidgetsOptions.elementAt(ref.watch(itemTappedProvider));

    final auth = ref.read(authProvider);
    return Scaffold(
      endDrawer: SizedBox(
        width: 250,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const SizedBox(height: 80),
              ListTile(
                leading: const Icon(
                  Icons.account_circle,
                  size: 30,
                ),
                title: const Text(
                  'Cuenta',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  // Acción al tocar el ítem
                },
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(
                  Icons.exit_to_app,
                  size: 30,
                ),
                title: const Text(
                  'Cerrar Sesión',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  if (auth.authGoogleStatus == AuthGoogleStatus.authenticated) {
                    ref.watch(authProvider.notifier).logoutGoogle();
                  } else if (auth.authStatus == AuthStatus.authenticated) {
                    ref.watch(authProvider.notifier).logout();
                  }
                  ref.read(noticesProvider.notifier).clearNotifications();
                  ref.read(activityProvider.notifier).clearActivityState();
                  ref.read(groupsProvider.notifier).clearGroupsState();
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBarHome(
        title: element.title,
      ),
      body: Center(
        child: element.widget,
      ),
      bottomNavigationBar: CustomNavbar(
        selectedIndex: ref.watch(itemTappedProvider),
        onItemSelected: onItemTapped,
        widgetsOptionsItems: widget.lsWidgetsOptions
            .map((e) => e.bottomNavigationBarItem)
            .toList(),
      ),
    );
  }
}
