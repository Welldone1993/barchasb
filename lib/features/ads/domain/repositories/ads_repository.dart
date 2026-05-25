import 'package:barchasb/core/utils/failure.dart';
import 'package:barchasb/features/ads/domain/entities/job_seeker_ads_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class AdsRepository {
  Future<Either<Failure, List<JobSeekerAdsEntity>>> fetchJobSeekerAds();
}
