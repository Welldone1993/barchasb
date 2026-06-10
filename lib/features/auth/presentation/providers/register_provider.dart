import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../../core/network/dio_provider.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/entities/register_entity.dart';
import '../../domain/entities/user_entity.dart';

class RegisterState {
  final bool isLoading;
  final LoginEntity? user;
  final UserEntity? registeredUser;
  final String? error;

  RegisterState({
    this.isLoading = false,
    this.user,
    this.registeredUser,
    this.error,
  });

  RegisterState copyWith({
    bool? isLoading,
    LoginEntity? user,
    UserEntity? registeredUser,
    String? error,
    bool clearError = false,
  }) => RegisterState(
    isLoading: isLoading ?? this.isLoading,
    user: user ?? this.user,
    registeredUser: registeredUser ?? this.registeredUser,
    error: clearError ? null : (error ?? this.error),
  );
}

class AuthNotifier extends StateNotifier<RegisterState> {
  final AuthRepositoryImpl _repository;
  final FlutterSecureStorage storage = FlutterSecureStorage();

  AuthNotifier(this._repository) : super(RegisterState());

  Future<void> register(RegisterEntity data) async {
    state = state.copyWith(isLoading: true, clearError: true);
    final result = await _repository.register(data);

    result.fold(
      (failure) =>
          state = state.copyWith(isLoading: false, error: failure.toString()),
      (user) {
        state = state.copyWith(isLoading: false, registeredUser: user);
      },
    );
  }
}

final registerProvider = StateNotifierProvider<AuthNotifier, RegisterState>((
  ref,
) {
  final dio = ref.watch(dioProvider);
  final remote = AuthRemoteDataSourceImpl(dio);
  final repo = AuthRepositoryImpl(remote);
  return AuthNotifier(repo);
});
