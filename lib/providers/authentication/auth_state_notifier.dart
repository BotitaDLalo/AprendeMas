import 'package:aprende_mas/config/services/google_signin_api.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/providers/authentication/auth_state.dart';
import 'package:aprende_mas/repositories/Interface_repos/authentication/auth_repository.dart';
import 'package:aprende_mas/models/authentication/auth_errors.dart';
import 'package:aprende_mas/repositories/Interface_repos/authentication/key_value_storage_service.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  final KeyValueStorageService keyValueStorageService;
  final GoogleSigninApi googleSigninApi;

  AuthStateNotifier(
      {required this.authRepository,
      required this.keyValueStorageService,
      required this.googleSigninApi})
      : super(AuthState()) {
    checkAuthStatus();
    checkAuthGoogleStatus();
  }

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

  Future<void> loginGoogleUser() async {
    try {
      final user = await authRepository.loginGoogle();
      _setLoggedGoogleUser(user);
    } on ConnectionTimeout {
      logout('Timeout');
    } catch (e) {
      logout('Error no controlado');
    }
  }

  Future<void> siginUser(
      String name, String email, String password, String role) async {
    try {
      final user = await authRepository.signin(name, email, password, role);
      _setRegisterUser(user);
    } on ConnectionTimeout {
      logoutGoogle('Timeout');
    } catch (e) {
      logoutGoogle('Error no controlado');
    }
  }

  Future<bool> resetPassword(String email) async {
    try {
      final resetPasswordStatus =
          await authRepository.resetPasswordRequest(email);
      if (!resetPasswordStatus) {
        return false;
      }
      return true;
    } catch (e) {
      //TODO: Checar lo de las excepcione
      throw Exception(e);
    }
  }

  void checkAuthStatus() async {
    try {
      final token = await keyValueStorageService.getValue<String>('token');
      if (token == null) return logout();
      final user = await authRepository.checkAuthStatus(token);
      _setLoggedUser(user);
    } catch (e) {
      logout();
    }
  }

  void checkAuthGoogleStatus() async {
    try {
      // final currentUser = await googleSigninApi.verifyExistingUser();
      final token =
          await keyValueStorageService.getValue<String>('idTokenGoogle');
      if (token == null) return logoutGoogle();
      final user = await googleSigninApi.checkSignInStatus(token);
      _setLoggedGoogleUser(user);
    } catch (e) {
      logoutGoogle();
    }
  }

  void _setLoggedUser(AuthUser user) async {
    await keyValueStorageService.setKeyValue('token', user.token);
    state = state.copyWith(
      authUser: user,
      authStatus: AuthStatus.authenticated,
      errorMessage: '',
    );
  }

  void _setLoggedGoogleUser(AuthUser user) async {
    await keyValueStorageService.setKeyValue('idTokenGoogle', user.token);
    state = state.copyWith(
        authUser: user,
        authGoogleStatus: AuthGoogleStatus.authenticated,
        errorMessage: '');
  }

  Future<void> logout([String? errorMessage]) async {
    await keyValueStorageService.removeKey('token');
    state = state.copyWith(
        authStatus: AuthStatus.notAuthenticated,
        user: null,
        errorMessage: errorMessage);
  }

  Future<void> logoutGoogle([String? errorMessage]) async {
    try {
      await googleSigninApi.handlerGoogleLogout();
      await keyValueStorageService.removeKey('idTokenGoogle');
      state = state.copyWith(
          authGoogleStatus: AuthGoogleStatus.notAuthenticated,
          user: null,
          errorMessage: errorMessage);
    } catch (e) {
      // throw Exception(e);
      return;
    }
  }

  void _setRegisterUser(User user) {
    state =
        state.copyWith(user: user, registerStatus: RegisterStatus.registered);
  }
}
