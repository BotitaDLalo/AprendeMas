import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/auth_provider.dart';
import 'package:aprende_mas/providers/authentication/auth_state.dart';

class AppBarHome extends ConsumerWidget implements PreferredSizeWidget{
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(authProvider);
    return AppBar(
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
        ]);
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
