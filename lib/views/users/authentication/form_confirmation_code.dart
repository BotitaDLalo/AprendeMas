import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/config/utils/catalog_names.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/auth_provider.dart';
import 'package:aprende_mas/providers/authentication/form_confirmation_code_provider.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:aprende_mas/views/widgets/buttons/button_login.dart';
import 'package:aprende_mas/views/widgets/inputs/textfield_number.dart';

class FormConfirmationCode extends ConsumerWidget {
  const FormConfirmationCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formConfirmationCode = ref.watch(formConfirmationCodeProvider);
    final formConfirmationCodeNotifier =
        ref.read(formConfirmationCodeProvider.notifier);

    ref.listen(
      authProvider,
      (previous, next) {
        if (next.errorMessage.isNotEmpty) {
          if (next.errorHandlingStyle == ErrorHandlingStyle.snackBar) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).clearSnackBars();
            errorMessage(context, next.errorMessage);
          }
        }
      },
    );

    ref.listen(
      formConfirmationCodeProvider,
      (previous, next) {
        if (next.isPosting) {
          showLoadingScreen(context);
        }
      },
    );

    return Form(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Confirmar código',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextfieldNumber(
                onChanged: formConfirmationCodeNotifier.oncodeField1Changed,
              ),
              TextfieldNumber(
                onChanged: formConfirmationCodeNotifier.oncodeField2Changed,
              ),
              TextfieldNumber(
                onChanged: formConfirmationCodeNotifier.oncodeField3Changed,
              ),
              TextfieldNumber(
                onChanged: formConfirmationCodeNotifier.oncodeField4Changed,
              ),
              TextfieldNumber(
                onChanged: formConfirmationCodeNotifier.oncodeField5Changed,
              ),
            ],
          ),
          const SizedBox(
            height: 65,
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.060,
            child: ButtonLogin(
              text: 'Confirmar',
              textColor: Colors.white,
              onPressed: () {
                if (formConfirmationCode.isPosting) {
                  return;
                }
                formConfirmationCodeNotifier.onVerifyCodeSubmit();
              },
              buttonStyle: AppTheme.buttonPrimary,
            ),
          )
        ],
      ),
    ));
  }
}
