import 'package:aprende_mas/providers/providers.dart';
import 'package:aprende_mas/repositories/Implement_repos/activity/activity_offline_repository_impl.dart';
import 'package:aprende_mas/repositories/Implement_repos/authentication/auth_user_offline_repository_impl.dart';
import 'package:aprende_mas/config/services/google/google_signin_api.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/providers/authentication/auth_state.dart';
import 'package:aprende_mas/repositories/Implement_repos/groups/groups_offline_repository_impl.dart';
import 'package:aprende_mas/repositories/Implement_repos/groups/groups_repository_impl.dart';
import 'package:aprende_mas/repositories/Implement_repos/subjects/subjects_offline_repository_impl.dart';
import 'package:aprende_mas/repositories/Implement_repos/subjects/subjects_respository_impl.dart';
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
  // final Function(int) setAllActivitiesOfflineState;
  final Function(int) getSubmissionsCallback;
  final Function(int) getSubmissionsOfflineCallback;
  final Function(List<Group>) setGroupsSubjectsState;
  final Function(List<Subject>) setSubjectsWithoutGroupState;
  final GroupsRepositoryImpl groups;
  final SubjectsRespositoryImpl subjects;
  // final ActivityRepositoryImpl activity;
  final ActivityOfflineRepositoryImpl activityOffline;
  final GroupsOfflineRepositoryImpl groupsOffline;
  final SubjectsOfflineRepositoryImpl subjectsOffline;
  final Function(int) getAllActivitiesOfflineCallback;
  final Function(int, String) sendSubmission;

  AuthStateNotifier(
      {required this.authUserOffline,
      required this.authRepository,
      required this.kv,
      required this.googleSigninApi,
      required this.setGroupsSubjectsState,
      required this.setSubjectsWithoutGroupState,
      required this.getSubmissionsCallback,
      required this.getSubmissionsOfflineCallback,
      required this.getAllActivitiesCallback,
      required this.getAllActivitiesOfflineCallback,
      required this.getGroupsSubjectsCallback,
      required this.getGroupsSubjectsOfflineCallback,
      required this.activityOffline,
      required this.groups,
      required this.subjects,
      required this.groupsOffline,
      required this.subjectsOffline,
      required this.sendSubmission
      // required this.activity,
      })
      : super(AuthState()) {
    checkInternet();
  }
  //# LOGIN USER

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

      int id = user.userId;
      String role = user.role;
      await verifyExistingFcmToken(id, role);
      _setLoggedUser(caller, user);
    } on WrongCredentials catch (e) {
      badResponseLogin(e.message);
    } on FcmTokenVerificatioFailed catch (e) {
      badResponseLogin(e.message);
    } on ConnectionTimeout {
      badResponseLogin('Se agotó el tiempo.');
    } catch (e) {
      badResponseLogin('Error no controlado');
    }
  }

  Future<bool> signinUser(String names, String lastName, String secondLastName,
      String email, String password, String role) async {
    try {
      final fcmToken = await FirebaseCM.getFcmToken();

      if (fcmToken != null) {
        final user = await authRepository.signin(
            names, lastName, secondLastName, email, password, role, fcmToken);

        if (user.email != "" && user.nombre != "" && user.rol != "") {
          _setRegisterUser(user);
          return true;
        }
        return false;
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

  Future<void> badResponseLogin([String? errorMessage]) async {
    state = state.copyWith(
        authStatus: AuthStatus.notAuthenticated,
        user: null,
        errorMessage: errorMessage);
  }

  Future<bool> verifyExistingFcmToken(int id, String role) async {
    final fcmToken = await FirebaseCM.getFcmToken();
    if (fcmToken != null) {
      bool tokenIsRegistered =
          await authRepository.verifyExistingFcmToken(id, fcmToken, role);
      return tokenIsRegistered;
    }
    return false;
  }

  // bool verified = await verifyExistingFcmToken();

  void _setLoggedUser(String caller, AuthUser user) async {
    const limit = 7;
    const authType = AuthenticatedType.auth;
    DateTime dateNow = DateTime.now();
    DateTime date7Days = dateNow.add(const Duration(days: limit));

    // final tokenFCM = await FirebaseCM.getFcmToken();

    await _saveUserDataKeyValue(
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
      List<Subject> lsSubjectsWithoutGroup =
          await subjects.getSubjectsWithoutGroup();

      //& actualizamos los state del usuario (grupos, materias, actividades, entregables)
      _saveUserAndUpdateState(activeUser, lsGroups, lsSubjectsWithoutGroup);

      //& TOKEN FIREBASE
    } else if (caller == "checkAuthStatus") {
      authUserOffline.updateUser(date7Days.toString());
      List<Group> lsGroups = await groups.getGroupsSubjects();
      List<Subject> lsSubjectsWithoutGroup =
          await subjects.getSubjectsWithoutGroup();

      await _submissionsPending(lsGroups, lsSubjectsWithoutGroup);

      await _updateUserState(lsGroups, lsSubjectsWithoutGroup);
    }

    state = state.copyWith(
      authUser: user,
      authenticatedType: authType,
      authStatus: AuthStatus.authenticated,
      authConectionType: AuthConectionType.online,
      errorMessage: '',
    );
  }

  void _setRegisterUser(User user) {
    state =
        state.copyWith(user: user, registerStatus: RegisterStatus.registered);
  }

  void _saveUserAndUpdateState(ActiveUser user, List<Group> lsGroups,
      List<Subject> lsSubjectsWithoutGroup) async {
    //& Guardar el usuario offline
    await authUserOffline.insertUser(
        user.userId, user.userName, user.email, user.activeDueDate, user.role);

    //& Guardar los grupos, materias y actividades offline
    await groupsOffline.saveGroupSubjects(lsGroups);

    await subjectsOffline.saveSubjectsWithoutGroup(lsSubjectsWithoutGroup);

    //& set para groups y subjects y activities state
    await setGroupsSubjectsState(lsGroups);
    await setSubjectsWithoutGroupState(lsSubjectsWithoutGroup);

    //& set para activity state grupos y materias
    for (var group in lsGroups) {
      for (var subj in group.materias ?? []) {
        final subject = subj as Subject;
        final subjectId = subject.materiaId;

        //& Actualizamos el state de actividades
        await getAllActivitiesCallback(subjectId);
        for (var act in subj.actividades ?? []) {
          final activity = act as Activity;
          final activityId = activity.actividadId;
          //TODO: METODO PARA GUARDAR ENTREGABLES OFFLINE (tbAlumnoActividades, tbEntregable)

          //& Guardar entregables offline set para submissions state
          List<Submission> lsSubmissions =
              await getSubmissionsCallback(activityId);
          await activityOffline.saveSubmissions(lsSubmissions, activityId);
        }
      }
    }

    //& set para activity state materias sin grupo
    for (var subject in lsSubjectsWithoutGroup) {
      final subjectId = subject.materiaId;

      await getAllActivitiesCallback(subjectId);
      for (var act in subject.actividades ?? []) {
        final activity = act as Activity;
        final activityId = activity.actividadId;

        List<Submission> lsSubmissions =
            await getSubmissionsCallback(activityId);
        await activityOffline.saveSubmissions(lsSubmissions, activityId);
      }
    }
  }

  Future<void> _updateUserState(
      List<Group> lsGroups, List<Subject> lsSubjectsWithoutGroup) async {
    //& set para groups y subject
    await setGroupsSubjectsState(lsGroups);
    await setSubjectsWithoutGroupState(lsSubjectsWithoutGroup);

    for (var group in lsGroups) {
      for (var sub in group.materias ?? []) {
        final subject = sub as Subject;
        final subjectId = subject.materiaId;
        await getAllActivitiesCallback(subjectId);
        for (var act in sub.actividades ?? []) {
          final activity = act as Activity;
          final activityId = activity.actividadId;
          await getSubmissionsCallback(activityId);
        }
      }
    }

    for (var subject in lsSubjectsWithoutGroup) {
      final subjectId = subject.materiaId;
      await getAllActivitiesCallback(subjectId);
      for (var act in subject.actividades ?? []) {
        final activity = act as Activity;
        final activityId = activity.actividadId;
        await getSubmissionsCallback(activityId);
      }
    }
  }

  Future<void> _submissionsPending(
      List<Group> lsGroups, List<Subject> lsSubjectsWithoutGroup) async {
    List<Submission> lsSubmissionsPending = [];

    //& set para activity state
    if (lsGroups.isNotEmpty) {
      for (var group in lsGroups) {
        for (var subj in group.materias ?? []) {
          for (var act in subj.actividades ?? []) {
            final activity = act as Activity;
            final activityId = activity.actividadId;

            //& Guardar entregables para submissions state
            List<Submission> lsSubmissions =
                await activityOffline.getSubmissionsPending(activityId);
            lsSubmissionsPending.addAll(lsSubmissions);
          }
        }
      }
    }

    if (lsSubjectsWithoutGroup.isNotEmpty) {
      for (var subject in lsSubjectsWithoutGroup) {
        for (var act in subject.actividades ?? []) {
          final activity = act as Activity;
          final activityId = activity.actividadId;

          //& Guardar entregables para submissions state
          List<Submission> lsSubmissions =
              await activityOffline.getSubmissionsPending(activityId);
          lsSubmissionsPending.addAll(lsSubmissions);
        }
      }
    }

    if (lsSubmissionsPending.isNotEmpty) {
      for (var submission in lsSubmissionsPending) {
        int activityId = submission.activityId ?? -1;
        if (activityId != -1) {
          String answer = submission.answer ?? "";
          bool submissionSentSuccess = await sendSubmission(activityId, answer);

          if (submissionSentSuccess) {
            int submissionId = submission.submissionId;
            await activityOffline.deleteSubmissionOfflineSent(submissionId);
          }
        }
      }
    }
  }

  Future<void> logout() async {
    await kv.removeKeyValue(cn.getKeyTokenName, cn.getKeyIdName,
        cn.getKeyRoleName, cn.getKeyUserName);
    await authUserOffline.deleteUser();
    state = state.copyWith(authStatus: AuthStatus.notAuthenticated, user: null);
  }

  //# LOGIN USER OFFLINE

  void checkAuthStatusOffline() async {
    try {
      DateTime dateNow = DateTime.now();
      final dbUser = await authUserOffline.getUser();
      if (dbUser.isNotEmpty) {
        final userOffline = AuthOfflineUser.userOffilineJsonToEntity(dbUser);
        final userDateLimit = DateTime.parse(userOffline.activeDueDate);

        if (dateNow.isBefore(userDateLimit)) {
          List<Group> lsGroups = await groupsOffline.getGroupsSubjects();
          List<Subject> lsSubjectsWithoutGroup =
              await subjectsOffline.getSujectsWithoutGroup();
          //TODO: MANDAR A TRAER Materias sin grupo
          _setLoggedOfflineUser(userOffline, lsGroups, lsSubjectsWithoutGroup);
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

  void _setLoggedOfflineUser(AuthOfflineUser userOffline, List<Group> lsGroups,
      List<Subject> lsSubjectsWithoutGroup) async {
    debugPrint("EL USUARIO NO TIENE INTERNET");

    final user = AuthUser(
        userId: userOffline.userId,
        userName: userOffline.userName,
        email: userOffline.email,
        role: userOffline.role,
        token: "");
    // _updateUserState(lsGroups, lsSubjectsWithoutGroup);
    _updateUserStateOffline(lsGroups, lsSubjectsWithoutGroup);

    state = state.copyWith(
      authUser: user,
      authStatus: AuthStatus.authenticated,
      authenticatedType: AuthenticatedType.auth,
      authConectionType: AuthConectionType.offline,
      errorMessage: '',
    );
  }

  Future<void> _updateUserStateOffline(
      List<Group> lsGroups, List<Subject> lsSubjectsWithoutGroup) async {
    //& set para groups y subject
    await setGroupsSubjectsState(lsGroups);
    await setSubjectsWithoutGroupState(lsSubjectsWithoutGroup);

    for (var group in lsGroups) {
      for (var sub in group.materias ?? []) {
        final subject = sub as Subject;
        final subjectId = subject.materiaId;
        // await getAllActivitiesCallback(subjectId);
        await getAllActivitiesOfflineCallback(subjectId);
        for (var act in sub.actividades ?? []) {
          final activity = act as Activity;
          final activityId = activity.actividadId;
          // await getSubmissionsCallback(activityId);
          await getSubmissionsOfflineCallback(activityId);
        }
      }
    }

    for (var subject in lsSubjectsWithoutGroup) {
      final subjectId = subject.materiaId;
      // await getAllActivitiesCallback(subjectId);
      await getAllActivitiesOfflineCallback(subjectId);
      for (var act in subject.actividades ?? []) {
        final activity = act as Activity;
        final activityId = activity.actividadId;
        // await getSubmissionsCallback(activityId);

        await getSubmissionsOfflineCallback(activityId);
      }
    }
  }

  //# LOGIN GOOGLE USER

  Future<void> loginGoogleUser() async {
    try {
      final user = await authRepository.loginGoogle();
      if (user.role != "") {
        _setLoggedGoogleUser(user);
      } else {
        _setMissingDataGoogleUserConfirmed(user.token);
      }
    } on ConnectionTimeout {
      badResponseLogin('Timeout');
    } catch (e) {
      badResponseLogin('Error no controlado');
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
    await _saveUserDataKeyValue(
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

    List<Group> lsGroups = await groups.getGroupsSubjects();

    _setUserDataGoogleState(lsGroups);

    state = state.copyWith(
        authUser: user,
        authenticatedType: authType,
        authGoogleStatus: AuthGoogleStatus.authenticated,
        authConectionType: AuthConectionType.offline,
        errorMessage: '');
  }

  void _setUserDataGoogleState(List<Group> lsGroups) async {
    //& set para groups y subjects y activities state
    await setGroupsSubjectsState(lsGroups);

    //& set para activity state
    for (var group in lsGroups) {
      for (var subj in group.materias ?? []) {
        final subject = subj as Subject;
        final subjectId = subject.materiaId;

        //& Actualizamos el state de actividades
        await getAllActivitiesCallback(subjectId);
        for (var act in subj.actividades ?? []) {
          final activity = act as Activity;
          final activityId = activity.actividadId;
          //TODO: METODO PARA GUARDAR ENTREGABLES OFFLINE (tbAlumnoActividades, tbEntregable)

          //& Guardar entregables offline set para submissions state
          await getSubmissionsCallback(activityId);
          // await activityOffline.saveSubmissions(lsSubmissions, activityId);
        }
      }
    }
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

//# KEY VALUE STORAGE
  _saveUserDataKeyValue<T>(
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
