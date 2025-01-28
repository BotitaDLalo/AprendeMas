import 'package:aprende_mas/providers/groups/groups_provider.dart';
import 'package:aprende_mas/providers/providers.dart';
import 'package:aprende_mas/repositories/Implement_repos/authentication/auth_user_offline_repository_impl.dart';
import 'package:aprende_mas/config/services/google/google_signin_api.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/providers/authentication/auth_state.dart';
import 'package:aprende_mas/repositories/Implement_repos/groups/groups_offline_repository_impl.dart';
import 'package:aprende_mas/repositories/Implement_repos/groups/groups_repository_impl.dart';
import 'package:aprende_mas/repositories/Interface_repos/authentication/auth_repository.dart';
import 'package:aprende_mas/config/data/key_value_storage_service.dart';
import 'package:aprende_mas/config/services/services.dart';
import 'package:aprende_mas/config/utils/utils.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final cn = CatalogNames();
  final AuthRepository authRepository;
  final KeyValueStorageService kv;
  final GoogleSigninApi googleSigninApi;
  final AuthUserOfflineRepositoryImpl authUserOffline;
  final Function() getGroupsSubjectsCallback;
  final Function() getGroupsSubjectsOfflineCallback;
  final Function(int) getAllActivitiesCallback;
  final Function(int) setAllActivitiesOfflineState;
  final Function(List<Group>) setGroupsSubjectsState;
  final GroupsRepositoryImpl groups;
  final GroupsOfflineRepositoryImpl groupsOffline;

  AuthStateNotifier({
    required this.authUserOffline,
    required this.authRepository,
    required this.kv,
    required this.googleSigninApi,
    required this.setGroupsSubjectsState,
    required this.getAllActivitiesCallback,
    required this.setAllActivitiesOfflineState,
    required this.getGroupsSubjectsCallback,
    required this.getGroupsSubjectsOfflineCallback,
    required this.groups,
    required this.groupsOffline,
  }) : super(AuthState()) {
    checkInternet();
  }

  void checkInternet() async {
    final checkInternet = await ConnectivityCheck.checkInternetConnectivity();
    if (checkInternet) {
      final authType = await kv.getAuthType();
      final authTypeEnum = AuthenticatedType.values.firstWhere(
        (element) => element.toString() == authType,
        orElse: () => AuthenticatedType.undefined,
      );
      if (authTypeEnum == AuthenticatedType.auth) {
        checkAuthStatus();
      } else if (authTypeEnum == AuthenticatedType.authGoogle) {
        checkAuthGoogleStatus();
      } else {
        logout();
      }
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

  Future<bool> siginUser(String names, String lastName, String secondLastName,
      String email, String password, String role) async {
    try {
      final user = await authRepository.signin(
          names, lastName, secondLastName, email, password, role);

      if (user.email != "" && user.nombre != "" && user.rol != "") {
        _setRegisterUser(user);
        return true;
      }
      return false;
    } on ConnectionTimeout {
      logoutGoogle('Timeout');
      return false;
    } catch (e) {
      logoutGoogle('Error no controlado');
      return false;
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
      final token = await kv.getToken();
      if (token == "") return logout();
      final user = await authRepository.checkAuthStatus(token);
      _setLoggedUser(caller, user);
    } catch (e) {
      logout();
    }
  }

  void checkAuthStatusOffline() async {
    try {
      DateTime dateNow = DateTime.now();
      final dbUser = await authUserOffline.getUser();
      if (dbUser.isNotEmpty) {
        final userOffline = AuthOfflineUser.userOffilineJsonToEntity(dbUser);
        final userDateLimit = DateTime.parse(userOffline.activeDueDate);

        if (dateNow.isBefore(userDateLimit)) {
          List<Group> lsGroups = await groupsOffline.getGroupsSubjects();
          _setLoggedOfflineUser(userOffline, lsGroups);
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

  Future<void> logout([String? errorMessage]) async {
    await kv.removeKeyValue(cn.getKeyTokenName, cn.getKeyIdName,
        cn.getKeyRoleName, cn.getKeyUserName);
    await authUserOffline.deleteUser();
    state = state.copyWith(
      authStatus: AuthStatus.notAuthenticated,
      user: null,
      // errorMessage: errorMessage
    );
  }

  void _setLoggedUser(String caller, AuthUser user) async {
    const limit = 7;
    const authType = AuthenticatedType.auth;
    DateTime dateNow = DateTime.now();
    DateTime date7Days = dateNow.add(const Duration(days: limit));

    await _setUserDataKeyValueStorage(
        cn.getKeyTokenName,
        user.token,
        cn.getKeyIdName,
        user.userId,
        cn.getKeyRoleName,
        user.role,
        cn.getKeyUserName,
        user.userName,
        cn.getKeyAuthTypeName,
        authType);
    if (caller == "loginUser") {
      ActiveUser activeUser = ActiveUser(
          userId: user.userId,
          userName: user.userName,
          email: user.email,
          activeDueDate: date7Days.toString(),
          role: user.role);

      List<Group> lsGroups = await groups.getGroupsSubjects();
      await _saveUserData(activeUser, lsGroups);

      //& actualizamos los state del usuario (grupos, materias, actividades)
      _setUserDataState(lsGroups);

      //& TOKEN FIREBASE
      final tokenFCM = await FirebaseCM.getFcmToken();
      debugPrint("TOKEN FIREBASE");
      debugPrint(tokenFCM);
    } else if (caller == "checkAuthStatus") {
      authUserOffline.updateUser(date7Days.toString());
    }

    state = state.copyWith(
      authUser: user,
      authenticatedType: authType,
      authStatus: AuthStatus.authenticated,
      authConectionType: AuthConectionType.online,
      errorMessage: '',
    );
  }

  void _setLoggedOfflineUser(
      AuthOfflineUser userOffline, List<Group> lsGroups) async {
    debugPrint("EL USUARIO NO TIENE INTERNET");

    final user = AuthUser(
        userId: userOffline.userId,
        userName: userOffline.userName,
        email: userOffline.email,
        role: userOffline.role,
        token: "");

    //& set para groups y subject
    setGroupsSubjectsState(lsGroups);

    for (var group in lsGroups) {
      for (var sub in group.materias ?? []) {
        final subject = sub as Subject;
        final subjectId = subject.materiaId;
        setAllActivitiesOfflineState(subjectId);
      }
    }

    state = state.copyWith(
      authUser: user,
      authStatus: AuthStatus.authenticated,
      authenticatedType: AuthenticatedType.auth,
      errorMessage: '',
    );
  }

  void _setUserDataState(List<Group> lsGroups) async {
    //& set para groups y subjects
    setGroupsSubjectsState(lsGroups);

    //& set para activity state
    for (var group in lsGroups) {
      for (var subj in group.materias ?? []) {
        final subject = subj as Subject;
        final subjectId = subject.materiaId;
        await getAllActivitiesCallback(subjectId);
      }
    }
  }

  void _setRegisterUser(User user) {
    state =
        state.copyWith(user: user, registerStatus: RegisterStatus.registered);
  }

  Future<void> loginGoogleUser() async {
    try {
      final user = await authRepository.loginGoogle();
      if (user.role != "") {
        _setLoggedGoogleUser(user);
      } else {
        _setMissingDataGoogleUserConfirmed(user.token);
      }
    } on ConnectionTimeout {
      logout('Timeout');
    } catch (e) {
      logout('Error no controlado');
    }
  }

  Future<void> missingDataGoogleUser(
      String names, String lastname, String secondLastname, String role) async {
    final user = await authRepository.registerMissingDataGoogle(
        names, lastname, secondLastname, role);
    _setLoggedGoogleUser(user);
  }

  void checkAuthGoogleStatus() async {
    try {
      // final currentUser = await googleSigninApi.verifyExistingUser();
      final token = await kv.getToken();
      if (token == "") return logoutGoogle();
      final user = await googleSigninApi.checkSignInStatus(token);
      _setLoggedGoogleUser(user);
    } catch (e) {
      logoutGoogle();
    }
  }

  void _setLoggedGoogleUser(AuthUser user) async {
    const authType = AuthenticatedType.authGoogle;
    _setUserDataKeyValueStorage(
        cn.getKeyTokenName,
        user.token,
        cn.getKeyIdName,
        user.userId,
        cn.getKeyRoleName,
        user.role,
        cn.getKeyUserName,
        user.userName,
        cn.getKeyAuthTypeName,
        authType);
    state = state.copyWith(
        authUser: user,
        authenticatedType: authType,
        authGoogleStatus: AuthGoogleStatus.authenticated,
        authConectionType: AuthConectionType.offline,
        errorMessage: '');
  }

  void _setMissingDataGoogleUserConfirmed(String token) async {
    await kv.setKeyValue(cn.getKeyTokenName, token);
    state = state.copyWith(theresMissingData: true);
  }

  Future<void> logoutGoogle([String? errorMessage]) async {
    try {
      await googleSigninApi.handlerGoogleLogout();
      await kv.removeKeyValue(cn.getKeyTokenName, cn.getKeyIdName,
          cn.getKeyRoleName, cn.getKeyUserName);
      state = state.copyWith(
          authGoogleStatus: AuthGoogleStatus.notAuthenticated,
          user: null,
          errorMessage: errorMessage);
    } catch (e) {
      return;
    }
  }

  _saveUserData(ActiveUser user, List<Group> lsGroups) async {
    await authUserOffline.insertUser(
        user.userId, user.userName, user.email, user.activeDueDate, user.role);

    await groupsOffline.saveGroupSubjects(lsGroups);
  }

  _setUserDataKeyValueStorage<T>(
      String keyToken,
      T valueToken,
      String keyId,
      T valueId,
      String keyRole,
      T valueRole,
      String keyUserName,
      T valueUserName,
      String keyAuthType,
      T valueAuthType) async {
    await kv.setKeyValue(keyToken, valueToken);
    await kv.setKeyValue(keyId, valueId);
    await kv.setKeyValue(keyRole, valueRole);
    await kv.setKeyValue(keyUserName, valueUserName);
    await kv.setKeyValue(keyAuthType, valueAuthType);
  }
}
