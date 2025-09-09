import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/config/utils/utils.dart';
import 'package:aprende_mas/views/users/authentication/form_login.dart';
import 'package:aprende_mas/views/widgets/alerts/error_snackbar.dart';
import 'package:aprende_mas/providers/providers.dart';

class LoginUserScreen extends ConsumerWidget {
  const LoginUserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void showErrorMessage(String message) {
      errorMessage(context, message);
    }

    hideSnackBar() {
      ScaffoldMessenger.of(context).clearSnackBars();
    }

    ref.listen(
      authProvider,
      (previous, next) {
        if (next.theresMissingData) {
          context.go("/missing-data");
        }
      },
    );

    ref.listen(
      authProvider,
      (previous, next) {
        if (next.isPendingAuthorizationUser) {
          context.go('/confirmation-code-screen');
        }
      },
    );

    ref.listen(
      authProvider,
      (previous, next) {
        if (next.errorMessage.isNotEmpty) {
          if (next.errorHandlingStyle == ErrorHandlingStyle.snackBar) {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
            hideSnackBar();
            showErrorMessage(next.errorMessage);
          }
        }
      },
    );

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
            ),
            body: const Center(
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  children: [FormLogin()],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
