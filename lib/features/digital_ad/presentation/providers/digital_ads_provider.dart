import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/network/dio_provider.dart';
import '../../data/datasource/digital_ads_remote_data_source.dart';
import '../../data/repositories/digital_ads_repository.dart';
import '../../domain/entities/digital_ad_entity.dart';

class DigitalAdsNotifier
    extends StateNotifier<AsyncValue<List<DigitalAdEntity>>> {
  final DigitalAdsRepositoryImpl _repository;

  DigitalAdsNotifier(this._repository) : super(const AsyncValue.loading()) {
    fetchDigitalAds();
  }

  Future<void> fetchDigitalAds() async {
    state = const AsyncValue.loading();
    final result = await _repository.fetchDigitalAds();
    result.fold(
      (failure) =>
          state = AsyncValue.error(failure.message, StackTrace.current),
      (ads) {
        state = AsyncValue.data(ads);
      },
    );
  }

  void toggleBookmark(String projectId) {
    // فعلاً خالی - بعداً پیاده‌سازی می‌شه
    print(projectId);
  }

  Future<void> refresh() async {
    await fetchDigitalAds();
  }
}

final digitalAdsProvider =
    StateNotifierProvider<
      DigitalAdsNotifier,
      AsyncValue<List<DigitalAdEntity>>
    >((ref) {
      final dio = ref.watch(dioProvider);
      final remote = DigitalAdsRemoteDataSourceImpl(dio);
      final repo = DigitalAdsRepositoryImpl(remote);
      return DigitalAdsNotifier(repo);
    });
