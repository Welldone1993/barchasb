import 'package:barchasb/core/utils/failure.dart';
import 'package:barchasb/features/work_space/domain/entities/ads_entity.dart';
import 'package:barchasb/features/work_space/domain/entities/weekly_stats_entity.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/work_space_repository.dart';
import '../datasource/work_space_remote_data_source.dart';

class WorkSpaceRepositoryImpl implements WorkSpaceRepository {
  final WorkSpaceRemoteDataSource _remoteDataSource;

  WorkSpaceRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<AdsEntity>>> fetchAds() async {
    try {
      final List<AdsEntity> ads = await _remoteDataSource.fetchAds();
      return Right(ads);
    } on ServerException catch (e) {
      return Left(Failure(e.message ?? 'خطا در دریافت اطلاعات از سرور'));
    }
  }

  @override
  Future<Either<Failure, List<WeeklyStatsEntity>>> fetchWeeklyStats() async {
    try {
      final List<WeeklyStatsEntity> weeklyStats = await _remoteDataSource
          .fetchWeeklyStats();
      return Right(weeklyStats);
    } on ServerException catch (e) {
      return Left(Failure(e.message ?? 'خطا در دریافت اطلاعات از سرور'));
    }
  }
}
