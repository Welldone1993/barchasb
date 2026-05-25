import 'package:barchasb/features/work_space/domain/entities/weekly_stats_entity.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/utils/failure.dart';
import '../entities/ads_entity.dart';

abstract class WorkSpaceRepository {
  Future<Either<Failure, List<AdsEntity>>> fetchAds();

  Future<Either<Failure, List<WeeklyStatsEntity>>> fetchWeeklyStats();
}
