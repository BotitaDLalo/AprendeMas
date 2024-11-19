import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/users/form_login.dart';
import 'package:aprende_mas/views/widgets/loading/loading_screen.dart';
import 'package:aprende_mas/providers/providers.dart';

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
