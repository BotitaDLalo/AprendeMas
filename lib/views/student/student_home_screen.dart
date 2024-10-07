import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/auth_provider.dart';
import 'package:aprende_mas/providers/authentication/auth_state.dart';
import 'package:aprende_mas/views/teacher/teacher.dart';
import 'package:aprende_mas/views/views.dart';

class StudentHomeScreen extends ConsumerStatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends ConsumerState<StudentHomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    AgendaScreen(),
    MateriasScreen(),
    NotificacionScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.read(authProvider);
    return Scaffold(
      appBar: AppBar(
          leading: const FlutterLogo(),
          backgroundColor: Colors.blue.shade900,
          actions: [
            IconButton(
                color: Colors.white,
                onPressed: () {
                  if (auth.authGoogleStatus == AuthGoogleStatus.authenticated) {
                    ref.watch(authProvider.notifier).logoutGoogle();
                  } else if (auth.authStatus == AuthStatus.authenticated) {
                    ref.watch(authProvider.notifier).logout();
                  }
                },
                icon: const Icon(Icons.arrow_back))
          ]),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomNavbar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
