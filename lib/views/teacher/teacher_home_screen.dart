import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/auth_provider.dart';
import 'package:flutter/material.dart';

class TeacherHomeScreen extends ConsumerWidget {
  const TeacherHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                ref.read(authProvider.notifier).logout();
              },
              child: Text('Cerrar Sesion')),
        ));
  }
}


// // import 'package:aprende_mas/views/views.dart';
// import 'package:aprende_mas/config/utils/packages.dart';
// import 'package:aprende_mas/views/teacher/Agenda_screen.dart';
// import 'package:aprende_mas/views/teacher/materias_screen.dart';
// import 'package:aprende_mas/views/teacher/notificacion_screen.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

// class TeacherHomeScreen extends ConsumerStatefulWidget {
//   const TeacherHomeScreen({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _TeacherHomeScreenState();
// }

// class _TeacherHomeScreenState extends ConsumerState<TeacherHomeScreen> {
//   int _selectedIndex = 0;
//   static const List<Widget> _widgetOptions = <Widget>[
//     AgendaScreen(),
//     MateriasScreen(),
//     NotificacionScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const FlutterLogo(),
//         actions: const [
//           Padding(
//               padding: EdgeInsets.only(right: 25.0),
//               child: CircleAvatar(
//                 backgroundImage: NetworkImage(''),
//               ))
//         ],
//         backgroundColor: Colors.blue.shade900,
//       ),
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: GNav(
//         color: Colors.grey,
//         tabs: const [
//           GButton(
//             icon: Icons.calendar_month_outlined,
//             text: 'Agenda',
//           ),
//           GButton(
//             icon: Icons.school_outlined,
//             text: 'Materias',
//           ),
//           GButton(
//             icon: Icons.notifications_none_rounded,
//             text: 'Notificaciones',
//           ),
//         ],
//         selectedIndex: _selectedIndex,
//       ),
//     );
//   }
// }