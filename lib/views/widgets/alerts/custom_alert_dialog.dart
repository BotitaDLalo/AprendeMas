import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/widgets/buttons/button_form.dart';

class CustomAlertDialog extends ConsumerWidget {
  final String message;
  final String comment;
  final String buttonContinueName;
  final String buttonCancelName;
  final VoidCallback onPressedContinue;
  final VoidCallback onPressedCancel;

  const CustomAlertDialog({
    super.key,
    required this.message,
    required this.comment,
    required this.buttonCancelName,
    required this.buttonContinueName,
    required this.onPressedContinue,
    required this.onPressedCancel
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      title: Text(
        message,
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
              comment,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonForm(
                    buttonName: buttonCancelName,
                    onPressed: onPressedCancel,
                    style: AppTheme.buttonSecondary),
                ButtonForm(
                    buttonName: buttonContinueName,
                    onPressed: onPressedContinue,
                    style: AppTheme.buttonPrimary)
              ],
            )
          ],
        ),
      ),
    );
  }
}
