import 'package:aprende_mas/config/services/google/google_signin_api_impl.dart';
import 'package:aprende_mas/providers/authentication/auth_state.dart';
import 'package:aprende_mas/providers/authentication/auth_state_notifier.dart';
import 'package:aprende_mas/providers/groups/groups_provider.dart';
import 'package:aprende_mas/providers/providers.dart';
import 'package:aprende_mas/repositories/Implement_repos/authentication/auth_user_offline_repository_impl.dart';
import 'package:aprende_mas/config/data/key_value_storage_service_impl.dart';
import 'package:aprende_mas/repositories/Implement_repos/groups/groups_offline_repository_impl.dart';
import 'package:aprende_mas/repositories/Implement_repos/groups/groups_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../repositories/Implement_repos/authentication/auth_repository_impl.dart';

final authProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  final authStateRepository = AuthRepositoryImpl();

  final keyValueStorageService = KeyValueStorageServiceImpl();
  final googleSigninApi = GoogleSigninApiImpl();

  final authUserOffline = AuthUserOfflineRepositoryImpl();

  final groups = GroupsRepositoryImpl();
  final groupsOffline = GroupsOfflineRepositoryImpl();

  final setGroupsSubjectsState = ref.read(groupsProvider.notifier).setGroups;

  final getAllActivitiesCallback =
      ref.read(activityProvider.notifier).getAllActivities;

  final setAllActivitiesOfflineState = ref.read(activityProvider.notifier).getAllActivitiesOffline; 

  final getGroupsSubjectsCallback =
      ref.read(groupsProvider.notifier).getGroupsSubjects;

  final getGroupsSubjectsOfflineCallback =
      ref.read(groupsProvider.notifier).getGroupsSubjectsOffile;

  

  return AuthStateNotifier(
      authUserOffline: authUserOffline,
      authRepository: authStateRepository,
      kv: keyValueStorageService,
      googleSigninApi: googleSigninApi,
      setGroupsSubjectsState: setGroupsSubjectsState,
      getAllActivitiesCallback: getAllActivitiesCallback,
      setAllActivitiesOfflineState: setAllActivitiesOfflineState,
      getGroupsSubjectsCallback: getGroupsSubjectsCallback,
      getGroupsSubjectsOfflineCallback: getGroupsSubjectsOfflineCallback,
      groups: groups,
      groupsOffline: groupsOffline);
});
