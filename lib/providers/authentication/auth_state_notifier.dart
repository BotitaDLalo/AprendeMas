import 'package:aprende_mas/repositories/Implement_repos/authentication/db_local_user_repository_impl.dart';
import 'package:aprende_mas/config/services/google/google_signin_api.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/providers/authentication/auth_state.dart';
import 'package:aprende_mas/repositories/Interface_repos/authentication/auth_repository.dart';
import 'package:aprende_mas/config/data/key_value_storage_service.dart';
import 'package:aprende_mas/config/services/services.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  final KeyValueStorageService keyValueStorageService;

  final GoogleSigninApi googleSigninApi;

  final DbLocalUserRepositoryImpl dbLocalUser;

  AuthStateNotifier({
    required this.dbLocalUser,
    required this.authRepository,
    required this.keyValueStorageService,
    required this.googleSigninApi,
  }) : super(AuthState()) {
    checkInternet();
  }

  void checkInternet() async {
    final checkInternet = await ConnectivityCheck.checkInternetConnectivity();

    if (checkInternet) {
      checkAuthStatus();
      checkAuthGoogleStatus();
    } else {
      checkAuthStatusOffline();
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      const caller = "loginUser";
      final user = await authRepository.login(email, password);
      _setLoggedUser(caller, user);
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
      throw Exception(e);
    }
  }

  void checkAuthStatus() async {
    try {
      const caller = "checkAuthStatus";
      final token = await keyValueStorageService.getToken();
      if (token == "") return logout();
      final user = await authRepository.checkAuthStatus(token);
      _setLoggedUser(caller, user);
    } catch (e) {
      logout();
    }
  }

  void checkAuthGoogleStatus() async {
    try {
      // final currentUser = await googleSigninApi.verifyExistingUser();
      final token = await keyValueStorageService.getToken();
      if (token == "") return logoutGoogle();
      final user = await googleSigninApi.checkSignInStatus(token);
      _setLoggedGoogleUser(user);
    } catch (e) {
      logoutGoogle();
    }
  }

  void checkAuthStatusOffline() async {
    try {
      DateTime dateNow = DateTime.now();
      final dbUser = await dbLocalUser.getUser();
      if (dbUser.isNotEmpty) {
        final userOffline = AuthOfflineUser.userOffilineJsonToEntity(dbUser);
        final userDateLimit = DateTime.parse(userOffline.fechaLimiteActivo);

        if (dateNow.isBefore(userDateLimit)) {
          _setLoggedOfflineUser(userOffline);
        } else {
          return;
        }
      } else {
        return;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  void _setLoggedUser(String caller, AuthUser user) async {
    const limit = 7;
    DateTime dateNow = DateTime.now();
    DateTime date7Days = dateNow.add(const Duration(days: limit));

    //TODO:
    // await keyValueStorageService.setKeyValue( 'token', user.token, 'id', user.id, 'role', user.rol);
    _setKeyValueStorage(
        keyValueStorageService.keyTokenName(),
        user.token,
        keyValueStorageService.keyIdName(),
        user.id,
        keyValueStorageService.keyRoleName(),
        user.rol,
        keyValueStorageService.keyUserName(),
        user.userName);
    if (caller == "loginUser") {
      await dbLocalUser.insertUser(
          user.id, user.userName, user.email, date7Days.toString(), user.rol);
      final tokenFCM = await FirebaseCM.getFcmToken();
      print("TOKEN FIREBASE");
      print(tokenFCM);
    } else if (caller == "checkAuthStatus") {
      dbLocalUser.updateUser(date7Days.toString());
    }

    state = state.copyWith(
      authUser: user,
      authStatus: AuthStatus.authenticated,
      errorMessage: '',
    );
  }

  void _setLoggedGoogleUser(AuthUser user) async {
    //TODO:
    // await keyValueStorageService.setKeyValue('idTokenGoogle', user.token, 'id', user.id, 'role', user.rol);
    // _setKeyValueStorage(
    //     'idTokenGoogle', user.token, 'id', user.id, 'role', user.rol);
    _setKeyValueStorage(
        keyValueStorageService.keyTokenName(),
        user.token,
        keyValueStorageService.keyIdName(),
        user.id,
        keyValueStorageService.keyRoleName(),
        user.rol,
        keyValueStorageService.keyUserName(),
        user.userName);
    state = state.copyWith(
        authUser: user,
        authGoogleStatus: AuthGoogleStatus.authenticated,
        errorMessage: '');
  }

  void _setLoggedOfflineUser(AuthOfflineUser userOffline) async {
    final user = AuthUser(
        id: userOffline.usuarioId,
        userName: userOffline.nombreUsuario,
        email: userOffline.correo,
        rol: 'Alumno',
        token: "");

    state = state.copyWith(
      authUser: user,
      authStatus: AuthStatus.authenticated,
      errorMessage: '',
    );
  }

  Future<void> logout([String? errorMessage]) async {
    await keyValueStorageService.removeKey(
        keyValueStorageService.keyTokenName(),
        keyValueStorageService.keyIdName(),
        keyValueStorageService.keyRoleName(),
        keyValueStorageService.keyUserName());
    await dbLocalUser.deleteUser();
    state = state.copyWith(
        authStatus: AuthStatus.notAuthenticated,
        user: null,
        errorMessage: errorMessage);
  }

  Future<void> logoutGoogle([String? errorMessage]) async {
    try {
      await googleSigninApi.handlerGoogleLogout();
      await keyValueStorageService.removeKey(
          keyValueStorageService.keyTokenName(),
          keyValueStorageService.keyIdName(),
          keyValueStorageService.keyRoleName(),
          keyValueStorageService.keyUserName());
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

  void _setKeyValueStorage<T>(
      String keyToken,
      T valueToken,
      String keyId,
      T valueId,
      String keyRole,
      T valueRole,
      String keyUserName,
      T valueUserName) async {
    await keyValueStorageService.setKeyValue(keyToken, valueToken);
    await keyValueStorageService.setKeyValue(keyId, valueId);
    await keyValueStorageService.setKeyValue(keyRole, valueRole);
    await keyValueStorageService.setKeyValue(keyUserName, valueUserName);
  }
}
