import 'package:flutter_riverpod/legacy.dart';

import '../../../../../core/network/dio_provider.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entities/login_entity.dart';

class AuthState {
  final bool isLoading;
  final LoginEntity? user;
  final String? error;

  AuthState({this.isLoading = false, this.user, this.error});

  AuthState copyWith({bool? isLoading, LoginEntity? user, String? error}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepositoryImpl repository;

  AuthNotifier(this.repository) : super(AuthState());

  Future<void> login(String phone, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final user = await repository.login(phone, password);
      state = state.copyWith(isLoading: false, user: user);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final dio = ref.watch(dioProvider);
  final remote = AuthRemoteDataSourceImpl(dio);
  final repo = AuthRepositoryImpl(remote);
  return AuthNotifier(repo);
});