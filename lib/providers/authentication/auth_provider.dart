
import 'package:aprende_mas/providers/authentication/auth_state.dart';
import 'package:aprende_mas/providers/authentication/auth_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../repositories/Implement_repos/auth_repository_impl.dart';

final authProvider = StateNotifierProvider<AuthStateNotifier,AuthState>((ref){
  final authStateRepository = AuthRepositoryImpl();

  return AuthStateNotifier(authRepository: authStateRepository);
});