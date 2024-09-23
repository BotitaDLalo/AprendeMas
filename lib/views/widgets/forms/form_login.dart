import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/providers.dart';
import 'package:aprende_mas/views/widgets/buttons/button_form.dart';
import 'package:aprende_mas/views/widgets/inputs/custom_text_form_field.dart';
import 'package:go_router/go_router.dart';

class FormLogin extends ConsumerWidget {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginForm = ref.watch(loginFormProvider);
    final loginFormNotifier = ref.read(loginFormProvider.notifier);

    return Container(
      width: 350,
      height: MediaQuery.of(context).size.height * 0.55,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
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
            textEditingController: loginFormNotifier.emailController,
            keyboardType: TextInputType.emailAddress,
            onChanged: loginFormNotifier.onEmailChanged,
            errorMessage:
                loginForm.isFormPosted ? loginForm.email.errorMessage : null,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            label: 'Contraseña',
            textEditingController: loginFormNotifier.passwordController,
            obscureText: true,
            onChanged: loginFormNotifier.onPasswordChanged,
            errorMessage:
                loginForm.isFormPosted ? loginForm.password.errorMessage : null,
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              context.push('/forgot-password');
            },
            child: Container(
                alignment: const Alignment(-0.8, 1),
                child: Text(
                  '¿Olvidaste tu contraseña?',
                  style: Theme.of(context).textTheme.bodySmall,
                )),
          ),
          Container(
              alignment: const Alignment(0.7, 2),
              child: ButtonForm(
                  buttonName: "Entra",
                  onPressed: () {
                    loginFormNotifier.onFormSubmit();
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
                // FocusScope.of(context).unfocus();
                loginFormNotifier.resetStateForm();
                context.push('/sigin-user');
              }),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
