import 'package:aprende_mas/config/utils/packages.dart';

class AppBarScreens extends ConsumerWidget implements PreferredSizeWidget {
  final VoidCallback? onPopCallback;
  const AppBarScreens({super.key, this.onPopCallback});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void actionsAppBar() {
      FocusScope.of(context).unfocus();
      context.pop();
      if (onPopCallback != null) {
        onPopCallback!();
      }
    }

    return AppBar(
      flexibleSpace: Container(
          // decoration: const BoxDecoration(gradient: AppTheme.degradedBlue),
          ),
      leading: IconButton(
          onPressed: () {
            actionsAppBar();
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
