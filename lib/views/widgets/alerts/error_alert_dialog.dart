import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/widgets/buttons/button_form.dart';

class ErrorAlertDialog extends ConsumerWidget {
  final String errorMessage;
  final String errorComment;

  const ErrorAlertDialog({
    super.key,
    required this.errorMessage,
    required this.errorComment,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      title: Text(
        errorMessage,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.15,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              textAlign: TextAlign.center,
              errorComment,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonForm(
                    buttonName: 'Cancelar',
                    onPressed: () => Navigator.of(context).pop(),
                    style: AppTheme.buttonSecondary),
                ButtonForm(
                    buttonName: 'Iniciar sesión',
                    onPressed: () {
                      context.go('/login-user');
                    },
                    style: AppTheme.buttonPrimary)
              ],
            )
          ],
        ),
      ),
      // actions: [
      //   ButtonForm(
      //       buttonName: 'Cancelar',
      //       onPressed: () {},
      //       style: AppTheme.buttonSecondary),
      //   ButtonForm(
      //       buttonName: 'Iniciar sesión',
      //       onPressed: () {},
      //       style: AppTheme.buttonPrimary)
      // ],
    );
  }
}
