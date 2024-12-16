import 'package:aprende_mas/config/services/google_signin_api_impl.dart';
import 'package:aprende_mas/providers/authentication/auth_state.dart';
import 'package:aprende_mas/providers/authentication/auth_state_notifier.dart';
import 'package:aprende_mas/repositories/Implement_repos/authentication/db_local_user_repository_impl.dart';
import 'package:aprende_mas/config/services/key_value_storage_service_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../repositories/Implement_repos/authentication/auth_repository_impl.dart';

final authProvider = StateNotifierProvider<AuthStateNotifier,AuthState>((ref){
  final authStateRepository = AuthRepositoryImpl();
  
  final keyValueStorageService = KeyValueStorageServiceImpl();
  final googleSigninApi = GoogleSigninApiImpl();

  final dbLocalUser  = DbLocalUserRepositoryImpl();

  return AuthStateNotifier(
    dbLocalUser: dbLocalUser,
    authRepository: authStateRepository, 
    keyValueStorageService: keyValueStorageService,
    googleSigninApi: googleSigninApi
    );
});