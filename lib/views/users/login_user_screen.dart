import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/auth_provider.dart';
import 'package:aprende_mas/providers/authentication/auth_state.dart';
import 'package:aprende_mas/providers/authentication/login_form_provider.dart';
import 'package:aprende_mas/views/widgets/forms/form_login.dart';
import 'package:aprende_mas/views/widgets/loading/loading_screen.dart';

class LoginUserScreen extends ConsumerWidget {
  const LoginUserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginForm = ref.watch(loginFormProvider);
    final authStatus = ref.watch(authProvider);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Stack(
        children: [
          loginForm.isPosting && authStatus.authStatus != AuthStatus.authenticated
              ? const LoadingScreen()
              : Scaffold(
                  body: Center(
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/logo.png', width: 150),
                          const SizedBox(
                            height: 40,
                          ),
                          const FormLogin()
                        ],
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
