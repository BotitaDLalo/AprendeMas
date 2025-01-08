import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/providers.dart';
import 'package:aprende_mas/views/widgets/buttons/button_form.dart';
import 'package:aprende_mas/views/widgets/inputs/custom_text_form_field.dart';
import 'package:aprende_mas/config/services/services.dart';

class FormLogin extends ConsumerStatefulWidget {
  const FormLogin({super.key});

  @override
  FormLoginState createState() => FormLoginState();
}

class FormLoginState extends ConsumerState<FormLogin> {
  @override
  void initState() {
    super.initState();
    ref.read(firebasecmProvider.notifier).onRequestPermissions();
    // FirebaseConfiguration.onMessagesForeground();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);
    final loginForm = ref.watch(loginFormProvider);
    final loginFormNotifier = ref.read(loginFormProvider.notifier);
    final fcm = ref.watch(firebasecmProvider);

    ref.listen(
      authProvider,
      (previous, next) {
        if (next.theresMissingData) {
          context.go("/missing-data");
        }
      },
    );

    return Container(
      width: 350,
      height: MediaQuery.of(context).size.height * 0.60,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            alignment: const Alignment(-0.8, 1),
            child: Text(
              'Inicia Sesión',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 15),
          CustomTextFormField(
            label: 'Correo',
            textEditingController: loginFormNotifier.emailController,
            keyboardType: TextInputType.emailAddress,
            onChanged: loginFormNotifier.onEmailChanged,
            errorMessage:
                loginForm.isFormPosted ? loginForm.email.errorMessage : null,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            label: 'Contraseña',
            textEditingController: loginFormNotifier.passwordController,
            obscureText: true,
            onChanged: loginFormNotifier.onPasswordChanged,
            errorMessage:
                loginForm.isFormPosted ? loginForm.password.errorMessage : null,
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              context.push('/forgot-password');
            },
            child: Container(
              alignment: const Alignment(-0.8, 1),
              child: Text(
                '¿Olvidaste tu contraseña?',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          Container(
            alignment: const Alignment(0.7, 2),
            child: ButtonForm(
              style: AppTheme.buttonPrimary,
              buttonName: "Entra",
              onPressed: () {
                if (loginForm.isPosting) {
                  return;
                }

                if (fcm.status == AuthorizationStatus.authorized) {
                  loginFormNotifier.onFormSubmit();
                } else {
                  ref.read(firebasecmProvider.notifier).onRequestPermissions();
                }
              },
            ),
          ),
          const SizedBox(height: 15),
          Text(
            '¿No tienes cuenta?',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          ButtonForm(
            style: AppTheme.buttonPrimary,
            buttonName: "Registrate",
            onPressed: () {
              loginFormNotifier.resetStateForm();
              context.push('/sigin-user');
            },
          ),
          const SizedBox(height: 15),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
            icon: const FaIcon(FontAwesomeIcons.google),
            onPressed: () {
              loginFormNotifier.onGoogleSubmit();
            },
            label: const Text("Inicio de sesión con Google"),
          ),
        ],
      ),
    );
  }
}
