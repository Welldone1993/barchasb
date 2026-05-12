import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/network/dio_provider.dart';
import '../../data/datasources/dashboard_remote_datasource.dart';
import '../../data/repositories/dashboard_repository_impl.dart';
import '../../domain/entities/user_entity.dart';

// class DashboardState {
//   final bool isLoading;
//   final String? error;
//   final UserEntity? user;
//
//   DashboardState({this.isLoading = false, this.error, this.user});
//
//   DashboardState copyWith({
//     bool? isLoading = false,
//     String? error,
//     bool clearError = false,
//     UserEntity? user,
//   }) => DashboardState(
//     isLoading: isLoading ?? this.isLoading,
//     error: clearError ? null : (error ?? this.error),
//     user: user ?? this.user,
//   );
// }

class DashboardNotifier extends StateNotifier<AsyncValue<UserEntity>> {
  final DashboardRepositoryImpl _repository;

  DashboardNotifier(this._repository) : super(AsyncValue.loading());

  Future<void> fetchUser() async {
    // state = state.copyWith(isLoading: true, clearError: true);
    state = const AsyncValue.loading();
    final result = await _repository.fetchUser();

    result.fold(
      (failure) =>
          // state = state.copyWith(isLoading: false, error: failure.toString()),
     state = AsyncValue.error(failure.message, StackTrace.current),
      (user) {
        // state = state.copyWith(isLoading: false, user: user);
        state = AsyncValue.data(user);
      },
    );
  }
}

final dashboardProvider =
    StateNotifierProvider<DashboardNotifier,  AsyncValue<UserEntity>>((ref) {
      final dio = ref.watch(dioProvider);
      final remote = DashboardRemoteDataSourceImpl(dio);
      final repo = DashboardRepositoryImpl(remote);
      return DashboardNotifier(repo);
    });
