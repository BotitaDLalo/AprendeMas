import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/providers.dart';
import 'package:aprende_mas/views/widgets/buttons/button_form.dart';
import 'package:aprende_mas/views/widgets/inputs/custom_text_form_field.dart';
import 'package:go_router/go_router.dart';

class FormSingin extends ConsumerWidget {
  const FormSingin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginForm = ref.watch(loginFormProvider);
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
                'Registrate',
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
              errorMessage:
                  loginForm.isFormPosted ? loginForm.email.errorMessage : null,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              label: 'Contraseña',
              obscureText: true,
              onChanged: ref.read(loginFormProvider.notifier).onPasswordChanged,
              errorMessage: loginForm.isFormPosted
                  ? loginForm.password.errorMessage
                  : null,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                alignment: const Alignment(0.9, 2),
                child: ButtonForm(
                    buttonName: "Entra",
                    onPressed: () {
                      ref.read(loginFormProvider.notifier).onFormSubmit();
                    })),
            const SizedBox(
              height: 15,
            ),
            Text(
              '¿Ya tienes una cuenta?',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            ButtonForm(
                buttonName: "Inicia sesión",
                onPressed: () {
                  context.push('/login-user');
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
