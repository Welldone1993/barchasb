import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/network/dio_provider.dart';
import '../../data/datasource/work_space_remote_data_source.dart';
import '../../data/repositories/work_space_repository_impl.dart';
import '../../domain/entities/ads_entity.dart';

class WorkSpaceAdsNotifier extends StateNotifier<AsyncValue<List<AdsEntity>>> {
  final WorkSpaceRepositoryImpl _repository;

  WorkSpaceAdsNotifier(this._repository) : super(const AsyncValue.loading()) {
    fetchAds();
  }

  Future<void> fetchAds() async {
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(seconds: 2));
    final result = await _repository.fetchAds();
    result.fold(
      (failure) =>
          state = AsyncValue.error(failure.message, StackTrace.current),
      (ads) {
        state = AsyncValue.data(ads);
      },
    );
  }
}

final workSpaceAdsProvider =
    StateNotifierProvider<WorkSpaceAdsNotifier, AsyncValue<List<AdsEntity>>>((
      ref,
    ) {
      final dio = ref.watch(dioProvider);
      final remote = WorkSpaceRemoteDataSourceImpl(dio);
      final repo = WorkSpaceRepositoryImpl(remote);
      return WorkSpaceAdsNotifier(repo);
    });
