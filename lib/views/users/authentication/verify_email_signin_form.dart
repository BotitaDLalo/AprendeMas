import 'package:aprende_mas/config/data/data.dart';
import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/config/utils/catalog_names.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/form_email_provider.dart';
import 'package:aprende_mas/providers/providers.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:aprende_mas/views/widgets/alerts/error_alert_dialog.dart';
import 'package:aprende_mas/views/widgets/buttons/button_login.dart';

class VerifyEmailSigninForm extends ConsumerWidget {
  const VerifyEmailSigninForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storageService = KeyValueStorageServiceImpl();
    final formEmail = ref.watch(formEmailProvider);
    final formEmailNotifier = ref.read(formEmailProvider.notifier);

    showErrorAlertDialog(String errorMessage, String errorComment) {
      showDialog(
        context: context,
        builder: (context) {
          return ErrorAlertDialog(
              errorMessage: errorMessage, errorComment: errorComment);
        },
      );
    }

    void closeLoadingScreen() {
      Navigator.of(context).pop();
    }

    void saveEmailUser() async {
      String email = formEmail.email.value;
      await storageService.saveEmail(email);
    }

    ref.listen(
      formEmailProvider,
      (previous, next) {
        if (next.isFormPosted && !next.isPosting) {
          saveEmailUser();
          context.push('/signin-user');
        }
      },
    );

    ref.listen(
      authProvider,
      (previous, next) {
        if (next.errorMessage.isNotEmpty &&
            next.errorComment.isNotEmpty &&
            next.errorHandlingStyle == ErrorHandlingStyle.dialog) {
          showErrorAlertDialog(next.errorMessage, next.errorComment);
        }
      },
    );

    return Form(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            '¿Cual es tu correo?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            icon: const Icon(
              Icons.alternate_email,
              size: 25,
            ),
            label: 'Correo',
            keyboardType: TextInputType.emailAddress,
            onChanged: formEmailNotifier.onEmailChanged,
            // errorMessage:
            //     siginForm.isFormPosted ? siginForm.email.errorMessage : null,
          ),
          const SizedBox(
            height: 65,
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.060,
            child: ButtonLogin(
              text: 'Verificar',
              textColor: Colors.white,
              onPressed: () {
                if (formEmail.isPosting) {
                  return;
                }
                formEmailNotifier.onVerifyEmailSigninSubmit();
              },
              buttonStyle: AppTheme.buttonPrimary,
            ),
          )
        ],
      ),
    ));
  }
}
