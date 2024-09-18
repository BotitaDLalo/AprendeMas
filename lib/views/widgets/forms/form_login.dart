import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/providers.dart';
import 'package:aprende_mas/views/widgets/buttons/button_form.dart';
import 'package:aprende_mas/views/widgets/inputs/custom_text_form_field.dart';
import 'package:go_router/go_router.dart';
import '../../../providers/authentication/auth_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FormLogin extends ConsumerWidget {
  const FormLogin({super.key});

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginForm = ref.watch(loginFormProvider);

    void resetState() {
      ref.read(authProvider.notifier).resetState();
    }

    ref.listen(authProvider, (previous, next) {
      if (next.errorMessage.isEmpty) return;
      Fluttertoast.showToast(
          msg: next.errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color.fromARGB(255, 207, 0, 0),
          textColor: Colors.white,
          fontSize: 16.0);
      resetState();
    });

    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: const Alignment(-0.8, 1),
              child: Text(
                'Inicia Sesión',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              label: 'Correo',
              keyboardType: TextInputType.emailAddress,
              onChanged: ref.read(loginFormProvider.notifier).onEmailChanged,
              // errorMessage:
              //     loginForm.isFormPosted ? loginForm.email.errorMessage : null,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              label: 'Contraseña',
              obscureText: true,
              onChanged: ref.read(loginFormProvider.notifier).onPasswordChanged,
              // errorMessage: loginForm.isFormPosted
              //     ? loginForm.password.errorMessage
              //     : null,
            ),
            const SizedBox(
              height: 10,
            ),
            // ButtonForm(
            //     buttonName: "Submit",
            //     onPressed: () {
            //       ref.read(loginFormProvider.notifier).onFormSubmit();
            //       print('Bien al parecer');
            //     }),
            Container(
                alignment: const Alignment(-0.8, 1),
                child: Text(
                  '¿Olvidaste tu contraseña?',
                  style: Theme.of(context).textTheme.bodySmall,
                )),
            Container(
                alignment: const Alignment(0.7, 2),
                child: ButtonForm(
                    buttonName: "Entra",
                    onPressed: () {
                      ref.read(loginFormProvider.notifier).onFormSubmit();
                    })),
            const SizedBox(
              height: 15,
            ),
            Text(
              '¿No tienes cuenta?',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            ButtonForm(
                buttonName: "Registrate",
                onPressed: () {
                  context.go('/singin-user');
                }),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
