import 'package:aprende_mas/config/utils/catalog_names.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/agenda/event_provider.dart';
import 'package:aprende_mas/providers/providers.dart';

class AppBarScreens extends ConsumerWidget implements PreferredSizeWidget {
  // final VoidCallback? onPopCallback;
  const AppBarScreens({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cn = ref.watch(catalogNamesProvider);
    final role = ref.watch(roleFutureProvider).maybeWhen(
          data: (role) => role,
          orElse: () => '',
        );
    void actionsAppBar() {
      FocusScope.of(context).unfocus();
      context.pop();
      // if (onPopCallback != null) {
      //   onPopCallback!();
      // }
    }


    return AppBar(
      forceMaterialTransparency: true,
      backgroundColor: Colors.white,
      flexibleSpace: Container(
          // decoration: const BoxDecoration(gradient: AppTheme.degradedBlue),
          ),
      leading: IconButton(
          onPressed: () {
            actionsAppBar();
            if (role == cn.getRoleTeacherName) {
              ref
                  .read(eventProvider.notifier)
                  .getEvents(); // 🔹 Solo actualiza para docentes
            } else if (role == cn.getRoleStudentName) {
              ref
                  .read(eventProvider.notifier)
                  .getEventsStudent(); // 🔹 Solo actualiza para alumnos
            }
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
