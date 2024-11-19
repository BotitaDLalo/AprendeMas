import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/teacher/ia/chat_gemini_screen.dart';
import 'package:aprende_mas/providers/authentication/auth_provider.dart';
import 'package:aprende_mas/providers/authentication/auth_state.dart';
import 'package:aprende_mas/views/teacher/teacher.dart';
import 'package:aprende_mas/views/views.dart';

class TeacherHomeScreen extends ConsumerStatefulWidget {
  const TeacherHomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends ConsumerState<TeacherHomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    AgendaScreen(),
    SubjectScreen(),
    NotificacionScreen(),
    ChatGeminiScreen(),
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
          leadingWidth: 200,
          leading: Transform.scale(
            scale: 2,
            child: SvgPicture.asset(
              "assets/icons/logo_horizontal-26.svg",
              colorFilter: const ColorFilter.mode(
                Colors.white, // Cambia el color del SVG aquí
                BlendMode.srcIn,
              ),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 13, 71, 161),
          flexibleSpace: Container(
            decoration: const BoxDecoration(gradient: AppTheme.degradedBlue),
          ),
          // backgroundColor: Colors.blue,
          toolbarHeight: 60,
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
                icon: const Icon(Icons.logout))
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
