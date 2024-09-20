import 'package:aprende_mas/config/router/router.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/auth_state.dart';
import 'package:aprende_mas/repositories/Interface_repos/auth_repository.dart';
import 'package:aprende_mas/models/authentication/auth_errors.dart';
import '../../models/authentication/user.dart';
import 'package:go_router/go_router.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;
  AuthStateNotifier({required this.authRepository}) : super(AuthState());

  Future<void> loginUser(String email, String password) async {
    // await Future.delayed(const Duration(milliseconds: 500));
    try {
      final user = await authRepository.login(email, password);
      _setLoggedUser(user);
    } on WrongCredentials {
      logout('Credenciales no son correctas');
    } on ConnectionTimeout {
      logout('Timeout');
    } catch (e) {
      logout('Error no controlado');
    }
  }

  Future<void> registerUser(String email, String password) async {}

  void checkAuthStatus() async {}

  void _setLoggedUser(User user) {
    state = state.copyWith(
      user: user,
      authStatus: AuthStatus.authenticated,
    );
  }

  void resetState() {
    state = AuthState();
  }

  Future<void> logout([String? errorMessage]) async {
    state = state.copyWith(
        authStatus: AuthStatus.notAuthenticated,
        user: null,
        errorMessage: errorMessage);
  }
}
