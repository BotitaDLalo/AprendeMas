import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/providers/groups/groups_provider.dart';

class AppBarScreens extends ConsumerWidget implements PreferredSizeWidget {
  final VoidCallback? onPopCallback;
  const AppBarScreens({super.key, this.onPopCallback});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groups = ref.read(groupsProvider.notifier);
    void clearGroupTeacherOption() {
      FocusScope.of(context).unfocus();
      context.pop();
      if (onPopCallback != null) {
        onPopCallback!();
      }
      groups.clearGroupTeacherOptionsLs();
    }

    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(gradient: AppTheme.degradedBlue),
      ),
      leading: IconButton(
          onPressed: () {
            clearGroupTeacherOption();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
