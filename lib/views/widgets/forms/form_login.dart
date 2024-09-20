import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/providers.dart';
import 'package:aprende_mas/views/widgets/buttons/button_form.dart';
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

    return Container(
      //color: Colors.white,
      width: 350,
      height: MediaQuery.of(context).size.height * 0.45,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
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
                context.push('/singin-user');
              }),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
