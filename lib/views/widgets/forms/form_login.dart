import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/providers.dart';
import 'package:aprende_mas/views/widgets/inputs/custom_text_form_field.dart';
import 'package:go_router/go_router.dart';
import '../../../providers/authentication/auth_provider.dart';

class FormLogin extends ConsumerWidget {
  const FormLogin({super.key});

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginForm = ref.watch(loginFormProvider);

    ref.listen(authProvider, (previous, next) {
      if (next.errorMessage.isEmpty) return;
      showSnackbar(context, next.errorMessage);
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
            FilledButton(
                onPressed: () {
                  ref.read(loginFormProvider.notifier).onFormSubmit();
                  print('Bien al parecer');
                },
                child: const Text('Submit')),
            Container(
                alignment: const Alignment(-0.8, 1),
                child: Text(
                  '¿Olvidaste tu contraseña?',
                  style: Theme.of(context).textTheme.bodySmall,
                )),
            Container(
              alignment: const Alignment(0.7, 2),
              child: FilledButton(onPressed: () {}, child: const Text('Entra')),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '¿No tienes cuenta?',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            FilledButton(
                onPressed: () {
                  context.go('/sing-up-users');
                },
                child: const Text('Registrate')),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
