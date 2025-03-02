import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/config/utils/utils.dart';
import 'package:aprende_mas/providers/authentication/auth_provider.dart';
import 'package:aprende_mas/providers/authentication/signin_form_provider.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:aprende_mas/views/widgets/buttons/button_login.dart';
import 'package:aprende_mas/views/widgets/inputs/custom_dropdown.dart';

class FormSingin extends ConsumerWidget {
  const FormSingin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cn = CatalogNames();
    final List<String> users = [cn.getRoleStudentName, cn.getRoleTeacherName];
    final signinForm = ref.watch(signinFormProvider);
    final signinFormNotifier = ref.read(signinFormProvider.notifier);
    // hideSnackBar() {
    //   ScaffoldMessenger.of(context).clearSnackBars();
    // }

    // ref.listen(
    //   authProvider,
    //   (previous, next) {
    //     if (next.errorMessage.isNotEmpty) {
    //       if (next.errorHandlingStyle == ErrorHandlingStyle.snackBar) {
    //         hideSnackBar();
    //         errorMessage(context, next.errorMessage);
    //       }
    //     }
    //   },
    // );

    void goToConfirmationCodeScreen() {
      Navigator.of(context).pop();
      context.push('/confirmation-code-screen');
    }

    closeLoadingScreen() {
      Navigator.of(context).pop();
    }

    ref.listen(
      signinFormProvider,
      (previous, next) {
        if (next.isFormPosted && !next.isPosting) {
          goToConfirmationCodeScreen();
        }
      },
    );

    ref.listen(
      signinFormProvider,
      (previous, next) {
        if (next.isFormNotPosted && !next.isPosting) {
          closeLoadingScreen();
        }
      },
    );

    ref.listen(
      signinFormProvider,
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
              'Crear cuenta',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              icon: const Icon(
                Icons.person,
                size: 25,
              ),
              label: "Nombres",
              onChanged: signinFormNotifier.onNameChanged,
              errorMessage:
                  signinForm.isFormPosted ? signinForm.name.errorMessage : null,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    icon: const Icon(
                      Icons.person,
                      size: 25,
                    ),
                    label: "Apellido Paterno",
                    onChanged: signinFormNotifier.onLastNameChanged,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomTextFormField(
                    icon: const Icon(
                      Icons.person,
                      size: 25,
                    ),
                    label: "Apellido Materno",
                    onChanged: signinFormNotifier.onSecondLastNameChanged,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              icon: const Icon(
                Icons.password,
                size: 25,
              ),
              label: 'Contraseña',
              obscureText: true,
              onChanged: signinFormNotifier.onPasswordChanged,
              errorMessage: signinForm.isFormPosted
                  ? signinForm.password.errorMessage
                  : null,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomDropdown(
              icon: const Icon(
                Icons.group,
                size: 25,
              ),
              label: 'Elige tu rol',
              items: users,
              onChanged: (p0) {
                signinFormNotifier.onRoleChanged(p0);
              },
            ),
            // const RoleDropdownSigin(),
            const SizedBox(
              height: 65,
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.060,
              child: ButtonLogin(
                text: 'Crear',
                textColor: Colors.white,
                onPressed: () {
                  if (signinForm.isPosting) {
                    return;
                  }
                  signinFormNotifier.onFormSigninSubmit();
                },
                buttonStyle: AppTheme.buttonPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
